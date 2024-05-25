import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/globle/color/dark_app_color.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';

class LightCardTheme {

  LightCardTheme._();

  static CardTheme lightCardTheme =   CardTheme(
  //  elevation: 0,
    color: LightAppColor.foreGroundColors,
    surfaceTintColor: LightAppColor.foreGroundColors,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Corner radius of the card
    ),

  );


}