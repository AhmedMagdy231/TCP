import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/InputField/validation/input_validator.dart';

import '../../../generated/l10n.dart';
import '../../component/TextField/text_form_field.dart';

class EmailFiled extends StatelessWidget {
  final TextEditingController controller;
  final bool edit;

  const EmailFiled({super.key, required this.controller, this.edit = false});


  @override
  Widget build(BuildContext context) {
    return  BuildTextFormField(
      controller: controller,
      hintText: S.of(context).email,
      prefixIcon: const Icon(FontAwesomeIcons.envelope),
      suffixIcon: edit? const Icon(FontAwesomeIcons.edit):null,
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      valid: InputValidator(context).emailValidator,
    );
  }
}
