import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/email_input_filed.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/passwrod_input_filed.dart';
import 'package:tricare_patient_application/core/component/TextField/text_form_field.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/feature/Authentication/Goolge/google.dart';
import 'package:tricare_patient_application/feature/HomeLayout/screens/home_layout_screen.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';

import '../../../../core/component/components.dart';
import '../../../../core/functions/fucntions.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../../../HomeLayout/cubit/app_cubit.dart';
import '../../cubit/auth_cubit.dart';
import '../Forget Password/forget_passwrod_screen.dart';
import '../Register/register_screen.dart';
import '../Set Password/set_password_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState

    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return buildGlobOverLay(
      widget: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
      if(state is GoogleRegisterLoading){
        context.loaderOverlay.show(widget: buildOverlayLoading(
          height,
          context: context,
        ));
      }
      
      if (state is GoogleRegisterSuccess) {
        context.loaderOverlay.hide();
      
        if (state.hasError) {
          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.failure,
              context: context,
      
              message: state.errors.join(' '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
      
      


      
          if(state.password){
            navigateTo(context, SetPasswordScreen(
              token: state.token,
            ));
          }
          else
          {
            await CashHelper.prefs.setString('token', state.token);
            CashHelper.prefs.setBool('login', true);

            context.read<ProfileCubit>().postUserData();
            Navigator.pop(context);
          }
      
      
      
          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.success,
              context: context,
              message: state.messages.join(' '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
      
      if (state is GoogleRegisterCancel) {
        context.loaderOverlay.hide();
      }

      if (state is GoogleRegisterError) {
        context.loaderOverlay.hide();
      }



      ///////////////////////////////////////////////////////////////////////////////


      if(state is FacebookRegisterLoading){
        context.loaderOverlay.show(widget: buildOverlayLoading(
          height,
          context: context,
        ));
      }

      if (state is FacebookRegisterSuccess) {
        context.loaderOverlay.hide();

        if (state.hasError) {
          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.failure,
              context: context,

              message: state.errors.join(' '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {

          if(state.password){
            navigateTo(context, SetPasswordScreen(token: state.token,));
          }
          else
          {
            await CashHelper.prefs.setString('token', state.token!);
            CashHelper.prefs.setBool('login', true);
            context.read<ProfileCubit>().postUserData();

            Navigator.pop(context);
          }


          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.success,
              context: context,
              message: state.messages.join(' '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }

      if (state is FacebookRegisterCancel) {
        context.loaderOverlay.hide();
      }

      if (state is FacebookRegisterError) {
        context.loaderOverlay.hide();
      }

      //////////////////////////////////////////////////////////////////////////////////////////

      if(state is AppleRegisterLoading){
        context.loaderOverlay.show(widget: buildOverlayLoading(
          height,
          context: context,
        ));
      }

      if (state is AppleRegisterSuccess) {
        context.loaderOverlay.hide();

        if (state.hasError) {
          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.failure,
              context: context,

              message: state.errors.join(' '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {





          if(state.password){
            navigateTo(context, SetPasswordScreen(
              token: state.token,
            ));
          }
          else
          {
            await CashHelper.prefs.setString('token', state.token);
            CashHelper.prefs.setBool('login', true);

            context.read<ProfileCubit>().postUserData();
            Navigator.pop(context);
          }



          var snackBar = Utils.buildSnackBar2(
              contentType: ContentType.success,
              context: context,
              message: state.messages.join(' '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }

      if (state is AppleRegisterCancel) {
        context.loaderOverlay.hide();
      }

      if (state is AppleRegisterError) {
        context.loaderOverlay.hide();
      }



        },
        child: Scaffold(
          body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: width * 0.6,
                  height: height * 0.1,
                ),
                Text(
                  S.of(context).welcomeAgainToTricare,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).login,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        S.of(context).loginToContinueUsingTheApp,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      EmailFiled(controller: emailController),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      PasswordFiled(controller: passwordController,hint: S.of(context).password,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                 navigateTo(context, ForgetPasswordScreen());
                              },
                              child: Text(
                                S.of(context).forgetPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      LoginButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController),



                      BuildSocialLogin(),


                      SizedBox(
                        height: height * 0.04,
                      ),
      

      
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).doNotHaveAnAccount,
                      style: Theme.of(context).textTheme.titleMedium!,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                            result: (route) => false);
                      },
                      child: Text(
                        S.of(context).register,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.primaryColor,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
        ),
      )),
      ),
    );
  }
}


class BuildSocialLogin extends StatelessWidget {
  const BuildSocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return   Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Expanded(child: Divider(thickness: 1.5,color: Colors.grey)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.02),
              child: Text(
                S.of(context).orLoginWith,
                 style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(child: Divider(thickness: 1.5,color: Colors.grey)),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
              context.read<AuthCubit>().registerWithGoogle();
              //Google.signOutGoogle();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width*0.07,vertical: height*0.007),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: SizedBox(
                  height: width*0.08,
                  width: width*0.08,
                  child: Image.asset('assets/images/google.png'),

                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                context.read<AuthCubit>().registerWithFacebook();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width*0.07,vertical: height*0.007),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: SizedBox(
                  height: width*0.08,
                  width: width*0.08,
                  child: Image.asset('assets/images/facebook.png'),

                ),
              ),
            ),

          if(!Platform.isIOS)
          GestureDetector(
              onTap: (){
                context.read<AuthCubit>().registerWithApple();
                //Google.signOutGoogle();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width*0.07,vertical: height*0.007),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: SizedBox(
                  height: width*0.08,
                  width: width*0.08,
                  child: Image.asset('assets/images/apple.png'),

                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class LoginButton extends StatelessWidget {
  final formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {


            if (state.hasError) {
              var snackBar = Utils.buildSnackBar2(
                  contentType: ContentType.failure,
                  context: context,
                  message: state.errors.join(' '));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {

              await CashHelper.prefs.setString('token', state.token!);
              CashHelper.prefs.setBool('login', true);

              context.read<ProfileCubit>().postUserData();


              if(CashHelper.getData(key: 'first') == null){
                navigateToToFinish(context, HomeLayoutScreen());
              }
              else
              {
                Navigator.pop(context);
              }
              CashHelper.prefs.setBool('first', false);

              var snackBar = Utils.buildSnackBar2(
                  contentType: ContentType.success,
                  context: context,
                  message: state.messages.join(' '));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }



        },
        child: Center(
          child: LoadingBtn(
            height: height * 0.06,
            borderRadius: 120,
            animate: true,
            color: AppColor.primaryColor,
            width: width,
            loader: Container(
              padding: const EdgeInsets.all(15),
              width: 50,
              height: 50,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            child:  Text(S.of(context).login),
            onTap: (startLoading, stopLoading, btnState) async {
              if (formKey.currentState!.validate()) {
                if (btnState == ButtonState.idle) {
                  startLoading();
                  FocusScope.of(context).unfocus();
                  await context.read<AuthCubit>().postLogin(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  stopLoading();
                }
              }
            },
          ),
        ),
    
    );
  }
}
