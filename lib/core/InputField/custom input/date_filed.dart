
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../component/TextField/text_form_field.dart';


class DateField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onTap;
  final double padding;


  const DateField({super.key, required this.controller,required this.onTap,this.padding = 0});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).date,
      read: true,
      prefixIcon: const Icon(Icons.date_range),
      maxLines: 1,
      onTap: onTap,
      contendPadding: padding == 0? null : EdgeInsets.symmetric(vertical: padding),


    );
  }
}