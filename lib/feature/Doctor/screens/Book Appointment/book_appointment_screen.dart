import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/component/Loading%20Button/loading_button.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/utils/utils.dart';
import 'package:tricare_patient_application/core/widgets/Down%20Button%20Stack/down_button_stack.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/cubit/confirm_book_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/choose_branches_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/choose_date_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/choose_time_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/stepper_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Book%20Appointment/widget/top_doctor_widget.dart';
import '../../../Book/model/branch_model.dart';
import '../../model/doctor_details_model.dart';
import '../../../Confirm Book Appointment/screen/Check Screen/check_screen.dart';

class BookAppointmentScreen extends StatelessWidget {
  final String doctorName;
  final String doctorPosition;
  final String doctorRate;
  final String doctorImage;
  final String doctorId;
  final List<Branches> branches;

  const BookAppointmentScreen({super.key, required this.doctorId,required this.doctorName, required this.doctorPosition, required this.doctorRate, required this.doctorImage, required this.branches});



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.9,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopDoctorWidget(
                        width: width,
                        height: height,
                        name: doctorName,
                        rate: doctorRate,
                        position: doctorPosition,
                        image: doctorImage,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      StepperWidget(),
                      ChooseBranchesWidget(
                        branches: branches,
                        doctorId: doctorId,
                        width: width,
                        height: height,
                      ),
                      ChooseDateWidget(
                        doctorId: doctorId,
                      ),
                      ChooseTimeWidget(doctorId: doctorId),
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

  const ConfirmButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return DownButtonStack(
      width: width,
      height: height,
      button: BlocListener<ConfirmBookCubit, ConfirmBookState>(
        listenWhen: (previous,current)=> previous.cartStatus != current.cartStatus,
        listener: (context, state) {
          switch(state.cartStatus){
            case Status.success:
              if(context.read<ConfirmBookCubit>().cartModel!.hasError == true){
                var snackBar = Utils.buildSnackBar2(
                    contentType: ContentType.failure,
                    context: context,
                    message: context.read<ConfirmBookCubit>().cartModel!.errors.join(' '));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else
              {

                navigateTo(context, CartScreen(cartModel: context.read<ConfirmBookCubit>().cartModel!,));

              }
            default:
              return;


          }

        },
        child: Center(
          child: LoadingButton(
            onTap: (startLoading, stopLoading, btnState) async {

              if (btnState == ButtonState.idle) {
                startLoading();

                if (context.read<DoctorCubit>().activeStep != 3) {

                  Utils.showDialog2(
                    context: context,
                    dialogType: DialogType.error,
                    widget: Text(
                      'Can not Confirm Book Appointment',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  );
                  return stopLoading();
                }


                await context.read<ConfirmBookCubit>().postCart(
                  slotId: context.read<DoctorCubit>().selectTimeId,
                );

                stopLoading();
              }
            },
            text: 'Confirm',
          ),
        ),
      ),
    );
  }
}
