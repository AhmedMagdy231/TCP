import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/passwrod_input_filed.dart';
import 'package:tricare_patient_application/core/component/SVG/svg.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/widgets/Carousel%20Widget/build_list_title.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../../core/component/Loading Button/loading_button.dart';
import '../../../../../core/component/TextField/text_form_field.dart';
import '../../../../../core/globle/color/dark_app_color.dart';
import '../../../../../generated/l10n.dart';

class BuildChangeProfilePicture extends StatelessWidget {
  final Future<void> Function() futureFunction;

  BuildChangeProfilePicture({
    Key? key,
    required this.passwordController,
    required this.futureFunction,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildListTitle(
      text: S.of(context).changeProfilePicture,
      iconName: 'profile_pic.svg',
      function: () {
        passwordController.clear();
        showDialog(
            context: context,
            builder: (context) {
              return BuildDialog(
                width: width,
                height: height,
                passwordController: passwordController,
                futureFunction: futureFunction,
              );
            });
      },
    );
  }
}

class BuildDialog extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController passwordController;
  final Future<void> Function() futureFunction;

  const BuildDialog(
      {super.key,
      required this.width,
      required this.height,
      required this.passwordController,
      required this.futureFunction});

  @override
  State<BuildDialog> createState() => _BuildDialogState();
}

class _BuildDialogState extends State<BuildDialog> {
  final formPasswordKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileCubit>().image = null;
  }

  bool choosePhoto = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height*0.9,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: widget.height*0.0,horizontal: widget.width*0.06),
        surfaceTintColor: DarkAppColor.foreGroundColors,

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.width * 0.03, vertical: widget.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    var cubit = context.read<ProfileCubit>();
                    return Center(
                      child: cubit.image != null
                          ? SizedBox(
                              width: widget.width * 0.6,
                              height: widget.width * 0.6,
                              child: Image.file(cubit.image!),
                            )
                          : Column(
                              children: [
                                Container(
                                  width: widget.width * 0.6,
                                  height: widget.width * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: choosePhoto
                                                ? Colors.black
                                                : Colors.red),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            context
                                                .read<ProfileCubit>()
                                                .pickImage(ImageSource.gallery);
                                          },
                                          child: Text(S.of(context).choosePhoto),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: widget.height * 0.01,
                                ),
                                Text(
                                  choosePhoto? '':S.of(context).pleaseChoosePhoto,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                    );
                  },
                ),
                SizedBox(
                  height: widget.height * 0.03,
                ),
                Text(
                  S.of(context).enterYourPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: widget.height * 0.01,
                ),
                Form(
                  key: formPasswordKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PasswordFiled(
                          controller: widget.passwordController,
                          hint: S.of(context).password),
                      SizedBox(
                        height: widget.height * 0.02,
                      ),
                      SizedBox(
                        width: widget.width,
                      ),
                      LoadingButton(
                        text: S.of(context).send,
                        onTap: (startLoading, stopLoading, btnState) async {
                          if (formPasswordKey.currentState!.validate()) {
                            if (btnState == ButtonState.idle) {
                              startLoading();
          
                              if (context.read<ProfileCubit>().image != null) {
                                FocusScope.of(context).unfocus();
                                await widget.futureFunction();
                              } else {
                                setState(() {
                                  choosePhoto = false;
                                });
                              }
          
                              stopLoading();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
