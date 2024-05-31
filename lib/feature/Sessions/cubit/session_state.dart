part of 'session_cubit.dart';

@immutable
 class SessionState {

  final Status sessionStatus;
  final Status sessionDetailsStatus;
  final Status sessionEditStatus;
  final  String callback;

  const SessionState({
    this.sessionStatus = Status.initial,
    this.sessionDetailsStatus = Status.initial,
    this.sessionEditStatus = Status.initial,
    this.callback = '',
  });

  SessionState copyWith({
    Status? sessionStatus,
    Status? sessionDetailsStatus,
    Status? sessionEditStatus,
    String? callback,
  }) =>
      SessionState(
        sessionStatus: sessionStatus ?? this.sessionStatus,
        sessionEditStatus: sessionEditStatus ?? this.sessionEditStatus,
        sessionDetailsStatus: sessionDetailsStatus ?? this.sessionDetailsStatus,
        callback: callback ?? this.callback,
      );


}


