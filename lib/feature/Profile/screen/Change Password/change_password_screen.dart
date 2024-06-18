import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/passwrod_input_filed.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../core/component/Loading Button/loading_button.dart';
import '../../../../core/globle/color/light_app_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).changePassword),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    PasswordFiled(
                        controller: currentPasswordController,
                        hint: S.of(context).enterCurrentPassword),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    PasswordFiled(
                        controller: newPasswordController,
                        hint: S.of(context).enterNewPassword),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    PasswordFiled(
                        controller: confirmPasswordController,
                        hint: S.of(context).enterConfirmPassword),
                  ],
                ),
              ),
            ),
            ChangePasswordButton(
              width: width,
              height: height,
              currentPasswordController: currentPasswordController,
              newPasswordController: newPasswordController,
              confirmPasswordController: confirmPasswordController,
              formKey: formKey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}

class ChangePasswordButton extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const ChangePasswordButton(
      {super.key,
      required this.width,
      required this.height,
      required this.currentPasswordController,
      required this.newPasswordController,
      required this.confirmPasswordController,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Stack(
        children: [
          Container(
            height: height * 0.1,
            color: LightAppColor.backgroundColor,
          ),
          Container(
            width: width,
            height: height * 0.1,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.01,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.02),
              child: BlocListener<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    if (state.hasError) {
                      var snackBar = Utils.buildSnackBar2(
                          contentType: ContentType.failure,
                          message: state.error.join(' '),
                          context: context);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Utils.showDialog2(
                        context: context,
                        dialogType: DialogType.success,
                        widget: Column(
                          children: [
                            SizedBox(
                              height: height * 0.3,
                              width: height * 0.3,
                              child: Image.asset('assets/images/success.png'),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Text(
                              state.message.join(' '),
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );

                      currentPasswordController.clear();
                      newPasswordController.clear();
                      confirmPasswordController.clear();
                    }
                  }
                },
                child: Center(
                  child: LoadingButton(
                      onTap: (startLoading, stopLoading, btnState) async {
                        if (formKey.currentState!.validate()) {

                          if (btnState == ButtonState.idle) {
                            startLoading();
                            // call your network api
                            await context.read<ProfileCubit>().changePassword(
                                  currentPassword: currentPasswordController.text.trim(),
                                  newPassword: newPasswordController.text.trim(),
                                  confirmPassword: confirmPasswordController.text.trim(),
                                );

                            stopLoading();
                          }
                        }
                      },
                      text: S.of(context).changePassword),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
