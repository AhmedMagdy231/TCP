part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class GetSearchDoctorLoading extends SearchState{}
class GetSearchDoctorSuccess extends SearchState{}
class GetSearchDoctorError extends SearchState{}


class NoInternetConnection extends SearchState{}





