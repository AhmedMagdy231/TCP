import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../../core/InputField/custom input/passwrod_input_filed.dart';
import '../../../../../core/component/Loading Button/loading_button.dart';
import '../../../../../core/globle/color/dark_app_color.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../../../generated/l10n.dart';

class BuildDeleteAccountWidget extends StatelessWidget {
  BuildDeleteAccountWidget({super.key});

  TextEditingController passwordController = TextEditingController();
  final formPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildListTitle(
      text: S.of(context).deleteAccount,
      iconName: 'delete.svg',
      function: () {
        passwordController.clear();
        showDialog(
            context: context,
            builder: (context) {
              return SizedBox(
                width: width,
                child: AlertDialog(
                  surfaceTintColor: DarkAppColor.foreGroundColors,
                  title: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).yourPassword,
                    ),
                  ),
                  content: Form(
                    key: formPasswordKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PasswordFiled(
                            controller: passwordController, hint: S.of(context).password),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: width,
                        ),
                        BlocListener<ProfileCubit, ProfileState>(
                          listener: (context, state) {
                            if(state is DeleteAccountSuccess){
                              Navigator.of(context).pop();
                              if(state.hasError){
                                var snackBar = Utils.buildSnackBar2(
                                  contentType: ContentType.failure,
                                  context: context,
                                  message: state.errors.join(' '),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              else{

                                var snackBar = Utils.buildSnackBar2(
                                  contentType: ContentType.success,
                                  context: context,
                                  message: state.messages.join(' '),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                              }
                            }
                          },
                          child: LoadingButton(
                            text: S.of(context).send,
                            onTap: (startLoading, stopLoading, btnState) async {
                              if (formPasswordKey.currentState!.validate()) {
                                if (btnState == ButtonState.idle) {
                                  startLoading();
                                  FocusScope.of(context).unfocus();

                                  await context
                                      .read<ProfileCubit>()
                                      .postDeleteAccount(
                                          password:
                                              passwordController.text.trim());

                                  stopLoading();
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
