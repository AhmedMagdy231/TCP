import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../color/dark_app_color.dart';
import '../../color/light_app_color.dart';

class LightAppBarTheme {

  LightAppBarTheme._();

  static AppBarTheme lightAppBarTheme =  const AppBarTheme(
    elevation: 0,
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //     bottomLeft: Radius.circular(5),
    //     bottomRight: Radius.circular(5),
    //   ),
    // ),
    iconTheme: IconThemeData(
      color: LightAppColor.textColor,
      size: 25
    ),
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,

    backgroundColor: LightAppColor.backgroundColor,

  );
}