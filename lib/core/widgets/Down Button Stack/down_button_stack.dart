import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Button/loading_button.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/book_appointment_screen.dart';

import '../../../../../core/globle/color/light_app_color.dart';

class DownButtonStack extends StatelessWidget {
  final double width;
  final double height;

  final Widget button;

   DownButtonStack({
    super.key,
    required this.width,
    required this.height,

    required this.button,

  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Stack(
        children: [
          Container(
            height: height * 0.1,
            color: LightAppColor.backgroundColor,
          ),
          Container(
            width: width,
            height: height * 0.1,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.01,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.02),
              child: button,
            ),
          ),
        ],
      ),
    );
  }
}
