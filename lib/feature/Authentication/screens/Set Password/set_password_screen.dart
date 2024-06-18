import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/InputField/custom%20input/passwrod_input_filed.dart';
import 'package:tricare_patient_application/core/component/Loading%20Button/loading_button.dart';

import '../../../../core/InputField/custom input/confirm_password_filed.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../../../Profile/cubit/profile_cubit.dart';
import '../../cubit/auth_cubit.dart';


class SetPasswordScreen extends StatefulWidget {
  final String token;
  SetPasswordScreen({Key? key,required this.token}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  S.of(context).pleaseSetPasswordToYourAccount,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                PasswordFiled(controller: passwordController, hint: S.of(context).password),
                SizedBox(
                  height: height * 0.02,
                ),
                ConfirmPasswordFiled(
                    confirmController: confirmPasswordController,
                    passwordController: passwordController,
                    hint: S.of(context).confirmPassword,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                _ConfirmButton(
                  formKey: formKey,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  height: height,
                  width: width,
                  token: widget.token,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}

class _ConfirmButton extends StatelessWidget {
  final String token;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final double height;
  final double width;

  const _ConfirmButton(
      {super.key,
      required this.formKey,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.height,
        required this.token,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) async{
    if (state is SetPasswordSuccess) {


      if (state.hasError) {
        var snackBar = Utils.buildSnackBar2(
            contentType: ContentType.failure,
            context: context,

            message: state.errors.join(' '));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {

        await CashHelper.prefs.setString('token', token);
        CashHelper.prefs.setBool('login', true);

        context.read<ProfileCubit>().postUserData();

        Navigator.pop(context);
        Navigator.pop(context);


        var snackBar = Utils.buildSnackBar2(
            contentType: ContentType.success,
            context: context,
            message: state.messages.join(' '));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  },
  builder: (context,state){
    return state is SetPasswordLoading?
    Center(child: CircularProgressIndicator(),):
   LoadingButton(
       onTap: (startLoading, stopLoading, btnState) async {
         if (formKey.currentState!.validate()) {
           FocusScope.of(context).unfocus();
           context.read<AuthCubit>().postSetPassword(
             token: token,
             confirmPassword: confirmPasswordController.text.trim(),
             password: passwordController.text.trim(),
           );
         }
       },
       text: S.of(context).confirm,
   );
  },
);
  }
}
