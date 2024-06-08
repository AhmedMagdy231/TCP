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
      lineStyle:  LineStyle(
        lineLength: 70,
        lineThickness: 2,
   //     progress: 1,
        defaultLineColor: Color(0xffd1e7dd),
        finishedLineColor: Colors.green,
        //progressColor: Colors.red,
        lineSpace: 4,
        lineType: LineType.normal,
        activeLineColor: Color(0xffd1e7dd),

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
      finishedStepBackgroundColor: Color(0xffd1e7dd),
      activeStepIconColor: Colors.white,
      showLoadingAnimation: true,
      activeStepTextColor: Colors.green,
      unreachedStepBorderColor: Colors.grey,
      activeStepBorderColor: Colors.grey,
      //unreachedStepBackgroundColor: Colors.red,







      steps: [

        EasyStep(
          customStep:   Icon(
            Icons.location_on,
            color: cubit.activeStep>=1?  Colors.green : Colors.grey,
          ),

          customTitle: Text(
            'Choose Branch',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color:  cubit.activeStep>=1?  Colors.green : Colors.grey,

            ),
          ),
        ),
        EasyStep(
          customStep:   Icon(
            Icons.date_range,
            color: cubit.activeStep>=2?  Colors.green : Colors.grey,
          ),
          customTitle:  Text(
            'Choose Date',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: cubit.activeStep>=2?  Colors.green: Colors.grey,
            ),
          ),
        ),
        EasyStep(
          customStep: Icon(
            Icons.access_time_sharp,
            color: cubit.activeStep>=3? Colors.green : Colors.grey,
          ),
          customTitle:  Text(
            'Choose Time',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: cubit.activeStep>=3?  Colors.green: Colors.grey,
            ),
          ),
        ),
      ],
  
    );
  },
);
  }
}
