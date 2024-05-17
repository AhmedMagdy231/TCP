import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/component/Loading%20Button/loading_button.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:tricare_patient_application/core/widgets/Show%20Rate/show_rate.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/choose_branches_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/choose_date_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/choose_time_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/stepper_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/top_doctor_widget.dart';

import '../../../../core/globle/color/light_app_color.dart';
import '../../../../core/globle/color/shared_color.dart';
import '../../../Category/model/doctor_details_model.dart';

class BookAppointmentScreen extends StatelessWidget {
  final Partner doctor;
  final List<Branches> branches;

  const BookAppointmentScreen(
      {super.key, required this.doctor, required this.branches});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Book Appointment'),
      ),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [

            SizedBox(
              height: height*0.9,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopDoctorWidget(
                        width: width,
                        height: height,
                        name: doctor.partnerFullname!,
                        rate: doctor.partnerReviewsAvg!,
                        position: doctor.partnerPosition!,
                        image: doctor.partnerPic!,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),

                     StepperWidget(),



                      ChooseBranchesWidget(
                        branches: branches,
                        doctorId: doctor.pARTNERID!,
                        width: width,
                        height: height,
                      ),

                      ChooseDateWidget(
                        doctorId: doctor.pARTNERID!,
                      ),

                      ChooseTimeWidget(doctorId: doctor.pARTNERID!),

                      SizedBox(
                        height: height * 0.1,
                      ),



                    ],
                  ),
                ),
              ),
            ),

            ConfirmButton(width: width, height: height),
            // the mat



          ],
        ),
      ),
    );
  }
}




class ConfirmButton extends StatelessWidget {
  final double width;
  final double height;

  const ConfirmButton(
      {super.key, required this.width, required this.height});

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
              child:   Center(
                child: LoadingButton(

                    onTap: (startLoading, stopLoading, btnState) async {
                      // if (formKey.currentState!.validate()) {
                      if (btnState == ButtonState.idle) {
                        startLoading();
                        // call your network api
                        await Future.delayed(Duration(seconds: 2));

                        stopLoading();
                      }
                    },
                    text: 'Confirm'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
