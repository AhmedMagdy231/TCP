part of 'book_mark_cubit.dart';

@immutable
 class BookMarkState  {

  final Status bookmarkStatus;
  final Status changeBookmarkStatus;
  final String callback;

  BookMarkState({
    this.callback = '',
    this.bookmarkStatus = Status.initial,
    this.changeBookmarkStatus = Status.initial,
  });

  BookMarkState copyWith({
    Status? bookmarkStatus,
    Status? changeBookmarkStatus,
    String? callback,
  }) =>
      BookMarkState(
        callback: callback ?? this.callback,
        bookmarkStatus: bookmarkStatus ?? this.bookmarkStatus,
        changeBookmarkStatus: changeBookmarkStatus ?? this.changeBookmarkStatus,
      );


}


