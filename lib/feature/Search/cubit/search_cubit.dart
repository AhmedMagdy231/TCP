import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Search/model/doctor_search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final _connect = ConnectionService();

  SearchDoctorModel? searchDoctorModel;



  Future<void> getDoctorSearch({required String query})async{

    if(await _connect.isInternetConnected()){

      emit(GetSearchDoctorLoading());

      DioHelper.postData(
          data: {
            'search_query' : query,
          },
          url: EndPoints.category_request,
      ).then((value){
        searchDoctorModel = SearchDoctorModel.formJson(value.data);
        emit(GetSearchDoctorSuccess());

      }).catchError((error){
        debugPrint(error.toString());
        emit(GetSearchDoctorError());
      });

    }

    else
      {

        emit(NoInternetConnection());
      }

  }




}
