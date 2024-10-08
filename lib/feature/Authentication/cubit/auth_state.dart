part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class NoInterNetConnection extends AuthState{}

class AuthInitial extends AuthState {}


class LoginLoading extends AuthState{}

class LoginSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final String? token;
  LoginSuccess({required this.hasError,required this.messages,required this.errors, required this.token});
}

class LoginError extends AuthState{}


class RegisterLoading extends AuthState{}

class RegisterSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  String? code;
  RegisterSuccess({required this.hasError,required this.messages,required this.errors,this.code});

}
class RegisterError extends AuthState{}


class OTPLoading extends AuthState{}
class OTPSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final String? token;
  OTPSuccess({required this.hasError,required this.messages,required this.errors,required this.token});
}
class OTPError extends AuthState{}



class ForgetPasswordLoading extends AuthState{}
class ForgetPasswordSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final String? uniqueId;
  ForgetPasswordSuccess({required this.hasError,required this.messages,required this.errors, required this.uniqueId});
}
class ForgetPasswordError extends AuthState{}



class ResetPasswordLoading extends AuthState{}
class ResetPasswordSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final token;

  ResetPasswordSuccess({required this.hasError,required this.messages,required this.errors, required this.token});
}
class ResetPasswordError extends AuthState{}

class ResendRegisterLoading extends AuthState{}
class ResendRegisterSuccess extends AuthState{}
class ResendRegisterError extends AuthState{}


class GoogleRegisterLoading extends AuthState{}
class GoogleRegisterSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final bool password;
  final token;

  GoogleRegisterSuccess({required this.password,required this.hasError,required this.messages,required this.errors, required this.token});
}
class GoogleRegisterError extends AuthState{}

class GoogleRegisterCancel extends AuthState{}






class SetPasswordLoading extends AuthState{}
class SetPasswordSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;


  SetPasswordSuccess({required this.hasError,required this.messages,required this.errors});
}
class SetPasswordError extends AuthState{}




class FacebookRegisterLoading extends AuthState{}
class FacebookRegisterSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final bool password;
  final token;

  FacebookRegisterSuccess({required this.password,required this.hasError,required this.messages,required this.errors, required this.token});
}
class FacebookRegisterError extends AuthState{}

class FacebookRegisterCancel extends AuthState{}



class AppleRegisterLoading extends AuthState{}
class AppleRegisterSuccess extends AuthState{
  final bool hasError;
  final List messages;
  final List errors;
  final bool password;
  final token;

  AppleRegisterSuccess({required this.password,required this.hasError,required this.messages,required this.errors, required this.token});
}
class AppleRegisterError extends AuthState{}

class AppleRegisterCancel extends AuthState{}


