import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/feature/Book/screen/book_screen.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/book_appointment_screen.dart';

import '../../../../../core/globle/color/light_app_color.dart';
import '../../../../../generated/l10n.dart';
import '../../../model/doctor_details_model.dart';

class BookAppointmentButton extends StatelessWidget {
  final double width;
  final double height;
  final DoctorDetailsModel doctorDetailsModel;

  const BookAppointmentButton(
      {super.key, required this.width, required this.height,required this.doctorDetailsModel});

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
                  vertical: height * 0.00, horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${int.parse(doctorDetailsModel!.data!.partner!.partnerSessionPrice!)- int.parse(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!)} ${S.of(context).egp}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            if(hasDiscount(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!))
                              SizedBox(width: 5,),
                            if(hasDiscount(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!))
                              Text(
                                '${doctorDetailsModel!.data!.partner!.partnerSessionPrice!} ${S.of(context).egp}',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),




                          ],
                        ),

                        if(hasDiscount(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!))
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: height*0.005),
                            child: Container(

                              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: 2),
                              margin: EdgeInsets.only(bottom: height*0.005),
                              child: Text(
                                '${calculateDiscountPercentage(doctorDetailsModel!.data!.partner!.partnerSessionPrice!, doctorDetailsModel!.data!.partner!.partnerSessionDiscount!)}%',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                      ],

                    ),
                  ),
                 //VerticalDivider(),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<DoctorCubit>().restartBookAppointment();
                        navigateTo(
                          context,
                          BookAppointmentScreen(
                            branches: context.read<DoctorCubit>().doctorDetailsModel!.data!.branches,
                            doctorImage: context.read<DoctorCubit>().doctorDetailsModel!.data!.partner!.partnerPic!,
                            doctorName: context.read<DoctorCubit>().doctorDetailsModel!.data!.partner!.partnerName!,
                            doctorPosition: context.read<DoctorCubit>().doctorDetailsModel!.data!.partner!.partnerPosition!,
                            doctorRate: context.read<DoctorCubit>().doctorDetailsModel!.data!.partner!.partnerReviewsAvg!,
                            doctorId: context.read<DoctorCubit>().doctorDetailsModel!.data!.partner!.partnerid!,
                            speciality: context.read<DoctorCubit>().doctorDetailsModel!.data!.partner!.specialtyTitle!,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(250),
                      )),
                      child: Text(S.of(context).bookAppointment),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
