 import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/widgets/Login%20First/login_first_widget.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Change%20Password/change_password_screen.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/widget/buid_delete_accout.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/widget/build_changeProfilePicture_with_password.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/widget/loading_shimmer.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/widget/top_widget.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Update%20Profile/update_profile_screen.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../../generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(S.of(context).profile),
      // ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = context.read<ProfileCubit>();
          return CashHelper.getData(key: 'login') == null
              ? BuildLoginFirst(
                  width: width,
                  height: height,
                  heightImage: width,
                  widthImage: width,
                )
              : cubit.userModel == null
                  ? const LoadingShimmerWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          TopWidget(height: height, width: width),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: double.infinity,
                                ),
                                Text(
                                  context
                                      .read<ProfileCubit>()
                                      .userModel!
                                      .data!
                                      .patient!
                                      .patientFullname!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  context
                                      .read<ProfileCubit>()
                                      .userModel!
                                      .data!
                                      .patient!
                                      .patientPhone!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.0,
                                vertical: height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BuildListTitle(
                                  text: S.of(context).updateProfile,
                                  iconName: 'edit.svg',
                                  function: () {
                                    navigateTo(context, UpdateProfile());
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                BlocListener<ProfileCubit, ProfileState>(
                                  listener: (context, state) {

                                    if(state is ChangeProfilePictureSuccess){
                                      Navigator.pop(context);

                                      if(state.hasError){
                                        var snackBar = Utils.buildSnackBar2(
                                            contentType: ContentType.failure,
                                            context: context,
                                            message: state.errors[0]);
                                        ScaffoldMessenger.of(
                                            context)
                                            .showSnackBar(snackBar);
                                      }
                                      else{
                                        context.read<ProfileCubit>().postUserData();
                                        var snackBar = Utils.buildSnackBar2(
                                            contentType: ContentType.success,
                                            context: context,
                                            message: state.messages[0]);
                                        ScaffoldMessenger.of(
                                            context)
                                            .showSnackBar(snackBar);

                                      }
                                    }



                                  },
                                  child: BuildChangeProfilePicture(
                                    passwordController: passwordController,
                                    futureFunction: () async {
                                     await context.read<ProfileCubit>().changeProfilePicture(password: passwordController.text.trim());

                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                BuildListTitle(
                                  text: S.of(context).changePassword,
                                  iconName: 'change_password.svg',
                                  function: () {
                                    navigateTo(context, ChangePasswordScreen());
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),

                                BuildDeleteAccountWidget(

                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
