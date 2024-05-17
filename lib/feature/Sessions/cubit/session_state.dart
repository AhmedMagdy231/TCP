part of 'session_cubit.dart';

@immutable
 class SessionState {

  final Status sessionStatus;
  final Status sessionDetailsStatus;
  final  String callback;

  const SessionState({
    this.sessionStatus = Status.initial,
    this.sessionDetailsStatus = Status.initial,
    this.callback = '',
  });

  SessionState copyWith({
    Status? sessionStatus,
    Status? sessionDetailsStatus,
    String? callback,
  }) =>
      SessionState(
        sessionStatus: sessionStatus ?? this.sessionStatus,
        sessionDetailsStatus: sessionDetailsStatus ?? this.sessionDetailsStatus,
        callback: callback ?? this.callback,
      );


}


