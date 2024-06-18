import 'package:flutter/cupertino.dart';

import '../../../generated/l10n.dart';

class InputValidator{

  final BuildContext context;

  InputValidator(this.context);


  String?  emailValidator(String? value){

    if(value == null || value.isEmpty)
      return S.of(context).pleaseEnterYourEmail;

    return null;

  }


  String?  phoneValidator(String? value){

    if(value == null || value.isEmpty)
      return S.of(context).pleaseEnterPassword;
    else if(value.length < 11 || value.length > 11)
      return S.of(context).phoneMustBe11Number;

    return null;

  }


  String?  whatsAppValidator(String? value){

    if(value!.isEmpty) return null;
   if(value!.length < 11 || value.length > 11)
      return S.of(context).phoneMustBe11Number;

    return null;

  }

  String?  nameValidator(String? value){

    if(value == null || value.isEmpty)
      return S.of(context).pleaseEnterYourName;

    return null;

  }


  String?  otpValidator(String? value){

    if(value == null || value.isEmpty)
      return S.of(context).pleaseEnterYourVerificationCode;

    return null;

  }


  String?  passwordValidator(String? value){

    if(value == null || value.isEmpty)
      return S.of(context).pleaseEnterYourPassword;
    else if(value.length < 6)
      return S.of(context).passwordIsToWeek;


    return null;

  }





}