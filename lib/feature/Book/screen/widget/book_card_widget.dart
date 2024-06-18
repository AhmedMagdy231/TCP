import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Book/cubit/book_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/book_appointment_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/widgets/Build Circle Image/build_circle_image.dart';
import '../../../../generated/l10n.dart';
import '../../../Sessions/model/session_model.dart';

class BookCardWidget extends StatelessWidget {

  final String day;
  final String date;
  final String time;
  final String name;
  final String image;
  final String position;
  final String speciality;
  final String status;
  final int index;
  final String doctorId;
  final String doctorRate;
  final String sessionId;
  final Sessions sessions;



  const BookCardWidget({
    super.key,
    required this.speciality,
    required this.day,
    required this.date,
    required this.time,
    required this.name,
    required this.image,
    required this.position,
    required this.status,
    required this.doctorId,
    required this.index,
    required this.doctorRate,
    required this.sessionId,
    required this.sessions,
  });

  Color getColorStatus(String status){



    switch(status){
      case "Pending":
        return AppColor.primaryColor;
      case 'Finished':
        return Colors.green;
      case 'انتظار':
        return AppColor.primaryColor;
      case 'أكتمل':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {




    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  status,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                    color: getColorStatus(status),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  '${day} - ${formatDate(date)} -',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  time,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1.5,
            ),
            Row(
              children: [
                BuildCircleImage(
                  image: image,
                  width: width * 0.2,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(name,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium),
                      Text(
                        '${sessions.branchLocation}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${sessions.roomName}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: BuildButtonWidget(
                    icon: Icons.location_on_outlined,
                    text: S.of(context).map,
                    onTap: () async{
                      final availableMaps = await MapLauncher.installedMaps;
                      // [AvailableMap { mapName: Google Maps, mapType: google }, ...]
                  
                      await availableMaps.first.showMarker(
                        coords: Coords(double.parse(sessions.branchMapsY!), double.parse(sessions.branchMapsX!)),
                        title: 'Tricare',
                      );
                    },
                  ),
                ),
               if( sessions.branchPhone!.isNotEmpty)
                Expanded(
                  child: BuildButtonWidget(
                    icon: Icons.call,
                    text: S.of(context).support,
                    onTap: () {
                      String url = 'tel: ${sessions.branchPhone}';
                      final Uri _url = Uri.parse(url);
                      launchUrl(_url,
                          mode: LaunchMode.externalApplication);
                    },
                  ),
                ),
                Expanded(
                  child: BlocConsumer<BookCubit, BookState>(
                    listener: (context, state) {
                      if (state.branchState == Status.success && index == context.read<BookCubit>().selectIndex) {
                        navigateTo(context,
                            BookAppointmentScreen(
                              edit: true,
                              sessionId: sessionId,
                              doctorId: doctorId,
                              doctorName: name,
                              doctorPosition: position,
                              doctorRate: doctorRate,
                              doctorImage: image,
                              branches:  context.read<BookCubit>().branchModel!.data!.branches,
                              speciality: '',
                            )
                        );
                      }
                    },
                    buildWhen: (previous, current) =>
                    previous.branchState != current.branchState &&
                        index == context
                            .read<BookCubit>()
                            .selectIndex,
                    builder: (context, state) {
                      switch (state.branchState) {
                        case Status.loading:
                          return Container(
                            height: height * 0.04,
                            width: width * 0.25,
                            child: Center(child: CircularProgressIndicator()),
                          );
                  
                        case Status.initial || Status.success:
                          return BuildButtonWidget(
                            icon: Icons.edit,
                            text: S.of(context).edit,
                            onTap: () {
                              context
                                  .read<BookCubit>()
                                  .selectIndex = index;
                              context.read<DoctorCubit>().restartBookAppointment();
                              // get branch
                              context.read<BookCubit>().getBranches(
                                  doctorId: doctorId);
                            },
                          );
                  
                  
                        default:
                          return SizedBox();
                      }
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildButtonWidget extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String text;

  const BuildButtonWidget(
      {super.key, required this.onTap, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height * 0.04,
        margin: EdgeInsets.symmetric(horizontal: width*0.01),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Text(
              text,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
