import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Home/model/home_model.dart';

import '../../../core/constant/constant.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../../core/network/Remote/DioHelper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());



  final _connect = ConnectionService();

  HomeModel? homeModel;

  Future<void> getHomeData() async {


    emit(GetHomeDataLoading());
   await Future.delayed(const Duration(seconds: 1));
    if(await _connect.isInternetConnected()){


      await DioHelper.getData(

        url: EndPoints.home_request,
      ).then((value) {

        homeModel = HomeModel.formJson(value.data);
        emit(GetHomeDataSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetHomeDataError());
      });
    }
    else
      {
        emit(NoInternetConnectionHome());
      }

  }


}
