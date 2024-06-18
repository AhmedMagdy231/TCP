import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../component/TextField/text_form_field.dart';
import '../validation/input_validator.dart';

class NameFiled extends StatelessWidget {
  final TextEditingController controller;
  final bool edit;
  final double padding;

  const NameFiled({super.key, required this.controller, this.edit = false,this.padding = 0});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).name,
      prefixIcon: const Icon(FontAwesomeIcons.user),
      suffixIcon: edit? const Icon(FontAwesomeIcons.edit):null,
      maxLines: 1,
      keyboardType: TextInputType.name,
      valid: InputValidator(context).nameValidator,
      contendPadding: padding == 0? null : EdgeInsets.symmetric(vertical: padding),
    );
  }
}// for the gain in the model for the middle






