import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globle/color/dark_app_color.dart';
import '../../globle/color/shared_color.dart';





class BuildDropDownButtonField extends StatelessWidget {

  late double height;
  late double width;
  late List item;
  late var cubit;
  late int num;
  late String hint;
  late String? Function(String?)? valid;
  late Function(String?) onChanged;


   BuildDropDownButtonField({
     required this.height,
     required this.width,
     required this.hint,
     required this.valid,
     required this.item,
     required this.onChanged,
});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(


      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:  AppColor.primaryColor,width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
         // borderSide: BorderSide(color:  AppColor.primaryColor),
        ),
      ),
      isExpanded: true,
      hint: Text(
        hint,
      ),

      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
        textDirection: TextDirection.ltr,
      ),
      iconSize: 30,
      buttonHeight: height * 0.08,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),

      dropdownMaxHeight: height * 0.75,
      scrollbarThickness: 10,
      scrollbarAlwaysShow: true,
      scrollbarRadius: Radius.circular(15),
      items: item
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,

        ),
      ))
          .toList(),
      validator: valid,


     dropdownElevation: 2,

      onChanged: onChanged,
      onSaved: (value) {},
    );
  }
}








