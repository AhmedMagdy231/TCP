part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}


class GetDateLoading extends BookState{}
class GetDateSuccess extends BookState{}
class GetDateError extends BookState{}

class GetTimeLoading extends BookState{}
class GetTimeSuccess extends BookState{}
class GetTimeError extends BookState{}


class GetAddReviewLoading extends BookState{}
class GetAddReviewSuccess extends BookState{}
class GetAddReviewError extends BookState{}


class NoInternetConnection extends BookState{}