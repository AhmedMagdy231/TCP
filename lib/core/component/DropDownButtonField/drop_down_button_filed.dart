import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globle/color/dark_app_color.dart';
import '../../globle/color/shared_color.dart';







class BuildDropDownButtonField extends StatelessWidget {
  final double height;
  final double width;
  final List item;
  final dynamic cubit;
  final String hint;
  final String? Function(String?)? valid;
  final Function(String?) onChanged;

  const BuildDropDownButtonField({
    super.key,
    required this.height,
    required this.width,
    required this.hint,
    required this.valid,
    required this.item,
    required this.onChanged,
    this.cubit,

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
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
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
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
          textDirection: TextDirection.ltr,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: height * 0.75,
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(10),
          radius: const Radius.circular(15),
        ),
        elevation: 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      buttonStyleData: ButtonStyleData(
          height: height * 0.08,
          padding: const EdgeInsets.only(left: 20, right: 10)),
      items: item
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
        ),
      ))
          .toList(),
      validator: valid,
      onChanged: onChanged,
      onSaved: (value) {},
    );
  }
}





/*
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

import '../../globle/color/shared_color.dart';

class BuildDropDownButtonField extends StatelessWidget {
  final double height;
  final double width;
  final List item;
  final dynamic cubit;
  final int num;
  final String hint;
  final String? Function(String?)? valid;
  final Function(String?) onChanged;

  const BuildDropDownButtonField({
    super.key,
    required this.height,
    required this.width,
    required this.hint,
    required this.valid,
    required this.item,
    required this.onChanged,
    this.cubit,
    required this.num,
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
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
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
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
          textDirection: TextDirection.ltr,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: height * 0.75,
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(10),
          radius: const Radius.circular(15),
        ),
        elevation: 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      buttonStyleData: ButtonStyleData(
          height: height * 0.08,
          padding: const EdgeInsets.only(left: 20, right: 10)),
      items: item
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                ),
              ))
          .toList(),
      validator: valid,
      onChanged: onChanged,
      onSaved: (value) {},
    );
  }
}

* */




