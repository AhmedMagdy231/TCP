import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/utils/utils.dart';
import 'package:tricare_patient_application/feature/Authentication/cubit/auth_cubit.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'HomeLayout/cubit/app_cubit.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int activeStep =0;
  @override
  Widget build(BuildContext context) {

    return  BlocListener<AppCubit,AppState>(
        listener: (context,state){
         },

      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
