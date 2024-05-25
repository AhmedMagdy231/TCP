part of 'confirm_book_cubit.dart';

@immutable
class ConfirmBookState {
  final String callback;
  final Status cartStatus;
  final Status checkStatus;

  ConfirmBookState({
      this.callback = '',
      this.cartStatus = Status.initial,
      this.checkStatus = Status.initial});


  ConfirmBookState copyWith({
    String? callback,
    Status? cartStatus,
    Status? checkStatus,
  }) =>
      ConfirmBookState(
        callback: callback ?? this.callback,
        cartStatus: cartStatus?? this.cartStatus,
        checkStatus: checkStatus?? this.checkStatus,

      );



}
