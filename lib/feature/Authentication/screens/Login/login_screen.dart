import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/email_input_filed.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/passwrod_input_filed.dart';
import 'package:tricare_patient_application/core/component/TextField/text_form_field.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../../HomeLayout/cubit/app_cubit.dart';
import '../../cubit/auth_cubit.dart';
import '../Forget Password/forget_passwrod_screen.dart';
import '../Register/register_screen.dart';

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
    return Scaffold(
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
                'Welcome Again To TriCare',
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
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Login to continue using the app',
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
                    PasswordFiled(controller: passwordController,hint: 'Password',),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                               navigateTo(context, ForgetPasswordScreen());
                            },
                            child: Text(
                              'Forget Password?',
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
                    SizedBox(
                      height: height * 0.08,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account?',
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
                      'Register',
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
    ));
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

    return BlocListener<AuthCubit, AuthState>(
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

             Navigator.pop(context);

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
          child: const Text("Login"),
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
