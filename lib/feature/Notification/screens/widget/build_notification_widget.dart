import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Article%20Details/article_details_screen.dart';
import 'package:tricare_patient_application/feature/Book/screen/book_screen.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/model/cart_model.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/doctor_details_screen.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/profile_screen.dart';
import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';

import '../../cubit/notification_cubit.dart';


class BuildNotificationWidget extends StatelessWidget {
  final String image;
  final String action;
  final String message;
  final String date;
  final String time;
  final String id;
  final String actionId;
  final String iconString;
  final String read;
  final int index;

  const BuildNotificationWidget(
      {super.key,
        required this.action,
        required this.index,
        required this.image,
        required this.message,
        required this.date,
        required this.time,
        required this.id,
        required this.iconString,
        required this.read,
        required this.actionId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        if (read == "0") {
          context.read<NotificationCubit>().readNotification(index: index, id: id);
        }



        switch (action) {

          case "my_profile":
            navigateTo(context, ProfileScreen());
            break;

          case "patients_sessions":
            navigateTo(context, BookScreen(comeFromHomeLayout: false,));
            break;


          case "doctors":
            context.read<DoctorCubit>().getDoctorDetails(id: actionId);
            navigateTo(context, DoctorDetailsScreen(id: actionId));
            break;

          case "pages":
            context.read<ArticleCubit>().getArticleDetailsData(id: actionId);
            context.read<ArticleCubit>().counter++;
            navigateTo(
                context,
                ArticleDetailsScreen(
                  articleId: actionId,
                  title: '',
                  countPage: context.read<ArticleCubit>().counter,
                ),
            );
            break;

          default:
            return;



        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: read == "0" ? LightAppColor.foreGroundColors : null,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: SizedBox(
          child: Row(
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 15,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Text(
                             formatDate(date),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Text(
                              formatTime(
                                int.parse(
                                  time,
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: width*0.02,),

              getIcon(iconString, width),
            ],
          ),
        ),
      ),
    );
  }



  Widget getIcon(String actionIcon,double width) {
    switch (actionIcon) {
      case "exclamation":
        return CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(
            Icons.warning_amber_rounded,
            color: Colors.blue,
          ),
        );
      case "check":
        return CircleAvatar(
          backgroundColor: Colors.green.shade50,
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ),
        );
      case "times":
        return CircleAvatar(
          backgroundColor: Colors.red.shade50,
          child: Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      default:
        return SizedBox();
    }
  }
}