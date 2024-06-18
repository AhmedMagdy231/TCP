import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';



class BuildTextFormField extends StatelessWidget {
  late TextEditingController controller;
  late String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? valid;
  void Function()? onTap;
  TextInputType? keyboardType;
  bool? isPassword;
  int? maxLines;
  EdgeInsetsGeometry? contendPadding;
  void Function(String)? onchange;
  bool read;



  BuildTextFormField({

    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.read = false,
    this.onTap,
    String? Function(String?)? this.valid,
    TextInputType? this.keyboardType,
    bool? this.isPassword,
    this.maxLines =1,
    this.onchange,
    this.contendPadding,


  });

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(
      readOnly: read,
      onChanged: onchange,
      autocorrect: true,
      controller: controller,
      maxLines: maxLines,
       onTap: onTap,
      validator: valid,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        contentPadding: contendPadding?? EdgeInsets.symmetric(vertical: height*0.025,horizontal: width*0.06 ),
      ),
    );
  }
}




class BuildTextField extends StatelessWidget {
  late TextEditingController controller;
  late String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? valid;
  TextInputType? keyboardType;
  bool? isPassword;
  String? label;
  int? maxLines;
  void Function(String)? onchange;



  BuildTextField({

    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    String? Function(String?)? this.valid,
    TextInputType? this.keyboardType,
    bool? this.isPassword,
    this.maxLines,
    this.onchange,
    this.label


  });

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return TextFormField(

      onChanged: onchange,
      autocorrect: true,
      controller: controller,
      maxLines: 1,
      minLines: 1,
      validator: valid,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        filled: false,
        label: Text('${label??''}'),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.0 ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor)
        ),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0.2))
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0.2))
        )
      ),
    );
  }
}

