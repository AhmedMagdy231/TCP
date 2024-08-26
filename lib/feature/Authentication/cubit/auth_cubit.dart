import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/feature/Authentication/Apple/apple.dart';
import 'package:tricare_patient_application/feature/Authentication/models/Register_model.dart';
import 'package:tricare_patient_application/feature/Authentication/models/login_model.dart';

import '../../../core/connection/internet_connection.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../Facebook/facebook.dart';
import '../Goolge/google.dart';
import '../models/Set Password/set_password_model.dart';
import '../models/forget_password_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final ConnectionService _connectivity = ConnectionService();
  LoginModel? loginModel;
  RegisterModel? registerModel;
  ForgetPasswordModel? forgetPasswordModel;
  SetPasswordModel? setPasswordModel;

  Future<void> postLogin({required String email, required String password}) async {
    if (await _connectivity.isInternetConnected()) {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 1));

      await DioHelper.postData(
        data: {
          'login_email': email,
          'login_password': password,
        },
        url: EndPoints.login_request,
      ).then((value) {
        loginModel = LoginModel.formJson(value.data);

        emit(LoginSuccess(
          hasError: loginModel!.hasError,
          errors: loginModel!.errors,
          messages: loginModel!.messages,
          token: loginModel!.hasError ? null : loginModel!.data!.patient!.patientAccesstoken,
        ));
      }).catchError((error) {
        debugPrint(error.toString());
        emit(LoginError());
      });
    }
    else
    {

      emit(NoInterNetConnection());
    }
  }

  Future<void> postRegister({required email, required phone, required password, required name,}) async {

    if(await _connectivity.isInternetConnected()){
      emit(RegisterLoading());
      await Future.delayed(const Duration(seconds: 1));
     await DioHelper.postData(
        data: {
          'accept_tos': 1,
          'patient_email': email,
          'patient_phone': phone,
          'patient_fullname': name,
          'patient_password': password,
        },
        url: EndPoints.register_request,
      ).then((value) {

        registerModel = RegisterModel.formJson(value.data);
        emit(RegisterSuccess(
          hasError: registerModel!.hasError,
          messages: registerModel!.messages,
          errors:  registerModel!.errors,
          code: registerModel!.hasError? '': registerModel!.data!.patientUniqueId,
        ),
        );
      }).catchError((error) {
        emit(RegisterError());
        print(error.toString());
      });
    }
    else
    {
     emit(NoInterNetConnection());
    }


  }


  Future<void> postEmailVerify({required String id,required String code})async{

    if(await _connectivity.isInternetConnected()){
      emit(OTPLoading());
      await Future.delayed(const Duration(seconds: 1));

      await  DioHelper.postData(
        data: {

          'patient_uniqueid': id,
          'patient_vcode': code,

        },
        url: EndPoints.registerVerify_Request,
      ).then((value){
        print(value.data);
        loginModel = LoginModel.formJson(value.data);
        if(loginModel!.hasError){
          emit(OTPSuccess(hasError: loginModel!.hasError,messages: loginModel!.messages,errors: loginModel!.errors,token: null));
        }
        else
        {
          emit(OTPSuccess(hasError: loginModel!.hasError,messages: loginModel!.messages,errors: loginModel!.errors,token:loginModel!.data!.patient!.patientAccesstoken!));
        }

      });
    }
    else {
      emit(NoInterNetConnection());
    }


  }


  Future<void> postForgetPassword({required String email})async{

   if(await _connectivity.isInternetConnected()){
     emit(ForgetPasswordLoading());
     await Future.delayed(const Duration(seconds: 1));

     await DioHelper.postData(
       url: EndPoints.forgetPassword_request,
       data: {
         'patient_email': email,
       },
     ).then((value){

       forgetPasswordModel = ForgetPasswordModel.formJson(value.data);

       emit(
         ForgetPasswordSuccess(
           hasError: forgetPasswordModel!.hasError,
           messages: forgetPasswordModel!.messages,
           errors: forgetPasswordModel!.errors,
           uniqueId: forgetPasswordModel!.hasError?'':forgetPasswordModel!.data!.patient_uniqueid,
         ),
       );


     }).catchError((error){
       emit(ForgetPasswordError());
     });
   }
   else{
     emit(NoInterNetConnection());
   }



  }


  Future<void> postResend({required String email})async{



    await DioHelper.postData(
      url: EndPoints.forgetPassword_request,
      data: {
        'patient_email': email,
      },
    ).then((value){

      forgetPasswordModel = ForgetPasswordModel.formJson(value.data);




    }).catchError((error){
      emit(ForgetPasswordError());
    });



  }


  Future<void> postRestPassword({required String id,required String code,required password})async{

     if(await _connectivity.isInternetConnected())
     {
       emit(ResetPasswordLoading());

       await Future.delayed(const Duration(seconds: 1));

       await  DioHelper.postData(
         data: {

           'patient_uniqueid': id,
           'patient_reset_vcode': code,
           'patient_password': password,
         },

         url: EndPoints.resetPassword_request,

       ).then((value){
         loginModel = LoginModel.formJson(value.data);
         emit(ResetPasswordSuccess(
           hasError: loginModel!.hasError,
           errors: loginModel!.errors,
           messages: loginModel!.messages,
           token: loginModel!.hasError? '': loginModel!.data!.patient!.patientAccesstoken,
         ));
       }
       );
     }
     else
     {
      emit(NoInterNetConnection());
     }

  }


  Future<void> postResendRegister({required email, required phone, required password, required name,}) async {

    if(await _connectivity.isInternetConnected()){
      emit(ResendRegisterLoading());
      await DioHelper.postData(
        data: {
          'accept_tos': 1,
          'patient_email': email,
          'patient_phone': phone,
          'patient_fullname': name,
          'patient_password': password,
        },
        url: EndPoints.register_request,
      ).then((value) {

        registerModel = RegisterModel.formJson(value.data);
        emit(ResendRegisterSuccess());
      }).catchError((error) {
        emit(ResendRegisterError());
        print(error.toString());
      });
    }
    else
    {
      emit(NoInterNetConnection());
    }


  }


  Future<void> postSetPassword({required String confirmPassword, required password,required String token}) async {
    emit(SetPasswordLoading());

    await DioHelper.postData(
      data:
      {
        'new_password': password,
        'new_password2': confirmPassword,
      },
      url: 'patient_register_complete.php',
      token: token,
    ).then((value) {
      setPasswordModel = SetPasswordModel.formJson(value.data);

      emit(SetPasswordSuccess(
        hasError: setPasswordModel!.hasError,
        errors: setPasswordModel!.errors,
        messages: setPasswordModel!.messages,

      ));
    }).catchError((error) {
      print(error.toString());
      emit(SetPasswordError());
    });
  }


  Future<void> registerWithGoogle() async {
    emit(GoogleRegisterLoading());
    GoogleSignInAccount? user = await Google.signInWithGoogle();




    if (user != null) {


      DioHelper.postDataRegister(
        data:
        {
          'google_id': user.id,
          'google_email': user.email,
          'google_name': user.displayName,
          'google_avatar_url': user.photoUrl,
        },
        url: 'google_callback.php',
      ).then((value) {

        loginModel = LoginModel.formJson(value.data);
        emit(
          GoogleRegisterSuccess(
            hasError: loginModel!.hasError,
            messages: loginModel!.messages,
            errors: loginModel!.errors,

            token: loginModel!.hasError ? '' : loginModel!.data!.patient!
                .patientAccesstoken!,

            password: loginModel!.hasError? false : loginModel!.data!.patient!.patientForcePassword == '0'? false : true,
          ),
        );
      }).catchError((error) {
        emit(GoogleRegisterError());
        print(error.toString());
      });
    }
    else {
      emit(GoogleRegisterCancel());
    }
  }



  Future<void> registerWithFacebook() async {

    FacebookUser? user = await Facebook.signInWithFacebook();

    emit(FacebookRegisterLoading());


    if (user != null) {


      DioHelper.postDataRegister(
        data:
        {
          'facebook_id': user.id,
          'facebook_email': user.email,
          'facebook_name': user.name,
          'facebook_avatar_url': user.profilePic,
        },
        url: 'facebook_callback.php',
      ).then((value) {

        loginModel = LoginModel.formJson(value.data);
        emit(
          FacebookRegisterSuccess(
            hasError: loginModel!.hasError,
            messages: loginModel!.messages,
            errors: loginModel!.errors,
            token: loginModel!.hasError ? '' : loginModel!.data!.patient!
                .patientAccesstoken!,

            password: loginModel!.hasError? false :
            loginModel!.data!.patient!.patientForcePassword == '0'? false : true,
          ),
        );
      }).catchError((error) {
        emit(FacebookRegisterError());
        print(error.toString());
      });
    }
    else {
      emit(FacebookRegisterCancel());
    }
  }



  Future<void> registerWithApple() async {
    emit(AppleRegisterLoading());


    Apple apple = Apple();
    final UserCredential? user = await apple.signInWithApple();

    if (user != null) {


      DioHelper.postDataRegister(
        data:
        {
          'apple_id': user.user!.uid,
          'apple_email': user.user!.email,
          'apple_name': user.user!.displayName,
          'apple_avatar_url': user.user!.photoURL,
        },
        url: 'apple_callback.php',
      ).then((value) {

        loginModel = LoginModel.formJson(value.data);
        emit(
          AppleRegisterSuccess(
            hasError: loginModel!.hasError,
            messages: loginModel!.messages,
            errors: loginModel!.errors,

            token: loginModel!.hasError ? '' : loginModel!.data!.patient!
                .patientAccesstoken!,

            password: loginModel!.hasError? false : loginModel!.data!.patient!.patientForcePassword == '0'? false : true,
          ),
        );
      }).catchError((error) {
        emit(AppleRegisterError());
        print(error.toString());
      });
    }
    else {
      emit(AppleRegisterCancel());
    }
  }


}
