import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tricare_patient_application/core/globle/color/dark_app_color.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';

class LightTextTheme {

  LightTextTheme._();

  static  TextTheme lightTextTheme = TextTheme(



    displayLarge: getTextTheme(size: 57,bold: true),
    displayMedium: getTextTheme(size: 45,bold: true),
    displaySmall: getTextTheme(size: 36,bold: true),

    headlineLarge: getTextTheme(size: 32,bold: true),
    headlineMedium: getTextTheme(size: 28,bold: true),
    headlineSmall: getTextTheme(size: 24,bold: false),


    titleLarge: getTextTheme(size: 22,bold: true),
    titleMedium: getTextTheme(size: 16,bold: false),
    titleSmall: getTextTheme(size: 14,bold: false),


    labelLarge: getTextTheme(size: 14,bold: true),
    labelMedium: getTextTheme(size: 12,bold: false),
    labelSmall: getTextTheme(size: 11,bold: false),


    bodyLarge: getTextTheme(size: 16),
    bodyMedium: getTextTheme(size: 14),
    bodySmall: getTextTheme(size: 12),





  );



  static TextStyle  getTextTheme({required double size,bool? bold}) => GoogleFonts.nunito(
    color: LightAppColor.textColor,
    fontWeight: bold == null? null :  FontWeight.bold,
    fontSize : size,
  );

}