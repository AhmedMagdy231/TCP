

 import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../Global Cubit/global_cubit.dart';

class Utils {

  static void showDialog2({
     required BuildContext context,
     required DialogType dialogType,
     required widget,
     String? action,
   }) => AwesomeDialog(
       dismissOnBackKeyPress: true,
       context: context,
       dialogType: dialogType,
     // dialogBackgroundColor: AppColor.primaryColor,
       animType: AnimType.scale,
       btnOkText: 'okay',
       title: 'Dialog Title',
       body: widget,
       btnOkColor: dialogType == DialogType.success
           ? Colors.green
           : dialogType == DialogType.error
           ? Color(0xffD03B42)
           : Color(0xffFFB61C),
       btnOkOnPress: () {

       },
     ).show();


  static SnackBar buildSnackBar2(
       {
          required ContentType contentType
         , required String message ,
           milSecond =3000,
         required BuildContext context,

       }) {
     return SnackBar(
       duration: Duration(milliseconds: milSecond),
       elevation: 0,
       behavior: SnackBarBehavior.floating,
       backgroundColor: Colors.transparent,
       content: AwesomeSnackbarContent(
         title: contentType == ContentType.success?
         context.read<GlobalCubit>().local == 'en'? 'Success Process':'عملية ناجحة':
         context.read<GlobalCubit>().local == 'en'? 'Failed Process':'عملية غير ناجحة',
         message: message,
         contentType: contentType,
       ),
     );
   }

 }

