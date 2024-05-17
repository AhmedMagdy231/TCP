part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}




class GetHomeDataLoading extends AppState{}
class GetHomeDataSuccess extends AppState{}
class GetHomeDataError extends AppState{}


class NoInternetConnectionHome extends AppState{}
