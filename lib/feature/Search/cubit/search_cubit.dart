import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Search/model/doctor_search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  final _connect = ConnectionService();

  SearchDoctorModel? searchDoctorModel;

void startSearch(){
  emit(state.copyWith(doctorSearchStatus: Status.initial));
}

  Future<void> getDoctorSearch({
    required String query,
    String? specialityId,
    String? branchId,
    String? dateId,
    String? page,
  })async{

    emit(state.copyWith(doctorSearchStatus: Status.loading));


    if(! await  _connect.isInternetConnected()) return emit(state.copyWith(doctorSearchStatus: Status.noInternet));

      emit(state.copyWith(doctorSearchStatus: Status.loading));

      DioHelper.postData(
          data: {

            'search_sec' : 1,
            'search_query' : query,
            'specialtyid' : specialityId??'',
            'search_branchid': branchId??'',
            'search_slot_date' : dateId??'',
            'page':page??'',

          },
          url: EndPoints.search_doctor_request,
      ).then((value){
        print(value.data);
        searchDoctorModel = SearchDoctorModel.formJson(value.data);
        emit(state.copyWith(doctorSearchStatus: Status.success));

      }).catchError((error){
        debugPrint(error.toString());
        emit(state.copyWith(doctorSearchStatus: Status.failure,callback: error.toString()));
      });



  }




}
