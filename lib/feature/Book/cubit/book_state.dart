part of 'book_cubit.dart';

@immutable
class BookState {
  final Status branchState;

  final  String callback;

  const BookState({
    this.branchState = Status.initial,

    this.callback = '',
  });

  BookState copyWith({
    Status? branchState,
    String? callback,
  }) =>
      BookState(
        branchState: branchState ?? this.branchState,

        callback: callback ?? this.callback,
      );
}




