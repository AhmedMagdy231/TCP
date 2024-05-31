import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/InputField/validation/input_validator.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../component/TextField/text_form_field.dart';

class ConfirmPasswordFiled extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  final String hint;

  const ConfirmPasswordFiled({super.key,required this.confirmController ,required this.passwordController,required this.hint});



  @override
  State<ConfirmPasswordFiled> createState() => _ConfirmPasswordFiledState();
}

class _ConfirmPasswordFiledState extends State<ConfirmPasswordFiled> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BuildTextFormField(
      isPassword: !show,
      controller: widget.confirmController,
      hintText: widget.hint,
      prefixIcon: const Icon(FontAwesomeIcons.lock),
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05),
        child: IconButton(
          icon: Icon(
            show
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            setState(() {
              show = !show;
            });
          },
        ),
      ),
      valid: (value){
        if(value!.isEmpty)
          return 'Please Enter Password';
        else if(value != widget.passwordController.text.trim())
          return 'Password Not Match';
        return null;
      },
    );
  }
}
