import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';

import '../../../../../core/globle/color/shared_color.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<DoctorCubit, DoctorState>(
  builder: (context, state) {
    var cubit = context.read<DoctorCubit>();

    return EasyStepper(
      enableStepTapping: false,
      lineStyle: const LineStyle(
        lineLength: 70,
        lineThickness: 2,
        lineSpace: 4,
        lineType: LineType.normal,
        activeLineColor: AppColor.primaryColor,
        unreachedLineColor: Colors.grey,
        unreachedLineType: LineType.dotted,

        // progressColor: Colors.purple.shade700,
      ),

      activeStep: cubit.activeStep,

      stepShape: StepShape.circle,

      borderThickness: 5,

      stepRadius: 30,
      // finishedStepBorderColor: Colors.white,
      finishedStepTextColor: Colors.deepOrange,
      finishedStepBackgroundColor: AppColor.primaryColor,
      activeStepIconColor: Colors.white,
      showLoadingAnimation: true,
      activeStepTextColor: Colors.green,






      steps: [
        EasyStep(
          customStep:   Icon(
            Icons.location_on,
            color: cubit.activeStep>=1?  Colors.white : Colors.grey,
          ),

          customTitle: Text(
            'Choose Branch',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color:  AppColor.primaryColor,

            ),
          ),
        ),
        EasyStep(
          customStep:   Icon(
            Icons.date_range,
            color: cubit.activeStep>=1?  Colors.white : Colors.grey,
          ),
          customTitle:  Text(
            'Choose Date',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: cubit.activeStep>=1?  AppColor.primaryColor: Colors.grey,
            ),
          ),
        ),
        EasyStep(
          customStep: Icon(
            Icons.access_time_sharp,
            color: cubit.activeStep>=2?  Colors.white : Colors.grey,
          ),
          customTitle:  Text(
            'Choose Time',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: cubit.activeStep>=2?  AppColor.primaryColor: Colors.grey,
            ),
          ),
        ),
      ],
  
    );
  },
);
  }
}
