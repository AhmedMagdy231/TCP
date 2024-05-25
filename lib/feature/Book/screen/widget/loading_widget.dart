import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/components.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Container%20Widget/build_container_widget.dart';
import 'package:tricare_patient_application/feature/Book/cubit/book_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/book_appointment_screen.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/widgets/Build Circle Image/build_circle_image.dart';

class BuildShimmerLoadingWidget extends StatelessWidget {



  const BuildShimmerLoadingWidget({
    super.key,


  });

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.009),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BuildShimmer(
            child: Column(
            children: [
              Row(
                children: [
                  BuildContainer(height: height*0.02,width: width*0.25,),

                  SizedBox(
                    width: width * 0.02,
                  ),
                  BuildContainer(height: height*0.02,width: width*0.25,),
                  SizedBox(
                    width: width * 0.02,
                  ),

                  BuildContainer(height: height*0.02,width: width*0.25,),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1.5,
              ),
              Row(
                children: [
                 Container(
                   width: width*0.2,
                   height: width*0.2,
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     shape: BoxShape.circle,
                   ),
                 ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildContainer(height: height*0.01,width: width*0.8,),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        BuildContainer(height: height*0.01,width: width*0.8,),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        BuildContainer(height: height*0.01,width: width*0.8,),
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
                    onTap: () {},
                  ),

                  BuildButtonWidget(
                    icon: Icons.location_on_outlined,
                    text: 'Map',
                    onTap: () {},
                  ),
                  BuildButtonWidget(
                    icon: Icons.call,
                    text: 'support',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),),
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
