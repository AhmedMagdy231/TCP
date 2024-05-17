import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class BuildTextFormField extends StatelessWidget {
  late TextEditingController controller;
  late String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? valid;
  TextInputType? keyboardType;
  bool? isPassword;
  int? maxLines;
  void Function(String)? onchange;



  BuildTextFormField({

    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    String? Function(String?)? this.valid,
    TextInputType? this.keyboardType,
    bool? this.isPassword,
    this.maxLines,
    this.onchange,


  });

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(

      onChanged: onchange,
      autocorrect: true,
      controller: controller,
      maxLines: isPassword != null? 1:maxLines,
      minLines: 1,
      validator: valid,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        contentPadding:  EdgeInsets.symmetric(vertical: height*0.025,horizontal: width*0.06 ),
      ),
    );
  }
}

