import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/InputField/validation/input_validator.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../component/TextField/text_form_field.dart';

class PasswordFiled extends StatefulWidget {
  final TextEditingController controller;

  final String hint;

  const PasswordFiled({super.key, required this.controller,required this.hint});



  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BuildTextFormField(
      isPassword: !show,
      controller: widget.controller,
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
      valid: InputValidator(context).passwordValidator,
    );
  }
}
