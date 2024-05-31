import 'package:flutter/material.dart';
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

class BookCardWidget extends StatelessWidget {
  final String day;
  final String date;
  final String time;
  final String name;
  final String image;
  final String position;
  final String status;
  final int index;
  final String doctorId;
  final String doctorRate;
  final String sessionId;


  const BookCardWidget({
    super.key,
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
  });

  Color getColorStatus(String status){



    switch(status){
      case "Pending":
        return AppColor.primaryColor;
      case 'Finished':
        return Colors.green;
      default:

        return Colors.red;
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
                      Text(
                        'Doctor',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Text(name,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium),
                      Text(
                        '${position}',
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
                BuildButtonWidget(
                  icon: Icons.location_on_outlined,
                  text: 'Map',
                  onTap: () async{
                    final availableMaps = await MapLauncher.installedMaps;
                    // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                    await availableMaps.first.showMarker(
                      coords: Coords(double.parse('30.105751'), double.parse('31.344614')),
                      title: 'Tricare',
                    );
                  },
                ),
                BlocConsumer<BookCubit, BookState>(
                  listener: (context, state) {
                    if (state.branchState == Status.success &&
                        index == context
                            .read<BookCubit>()
                            .selectIndex) {
                      navigateTo(context,
                          BookAppointmentScreen(
                            edit: true,
                            sessionId: sessionId,
                            doctorId: doctorId,
                            doctorName: name,
                            doctorPosition: position,
                            doctorRate: doctorRate,
                            doctorImage: image,
                            branches:  context
                                .read<BookCubit>()
                                .branchModel!.data!.branches,
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
                          text: 'Edit',
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
                BuildButtonWidget(
                  icon: Icons.call,
                  text: 'support',
                  onTap: () {
                    String url =
                        'tel: 01020022351';
                    final Uri _url = Uri.parse(url);
                    launchUrl(_url,
                        mode: LaunchMode.externalApplication);
                  },
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
        width: width * 0.25,
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
