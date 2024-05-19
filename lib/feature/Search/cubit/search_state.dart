part of 'search_cubit.dart';


class SearchState {
  final Status doctorSearchStatus;
  final String callback;

  SearchState({
    this.doctorSearchStatus = Status.initial,
    this.callback = '',
});


  SearchState copyWith({
    Status? doctorSearchStatus,
    String? callback
}) =>  SearchState(
    doctorSearchStatus: doctorSearchStatus?? this.doctorSearchStatus,
    callback: callback?? this.callback,
  );


}







