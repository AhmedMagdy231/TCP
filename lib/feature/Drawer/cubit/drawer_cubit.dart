import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Drawer/model/about_us_model.dart';
import 'package:tricare_patient_application/feature/Drawer/model/setting_model.dart';
import 'package:tricare_patient_application/feature/Drawer/model/tos_model.dart';

import '../../../core/network/Remote/DioHelper.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  SettingModel? settingUrlModel;
  TosModel? tosModel;
  AboutUsModel? aboutUsModel;
  final _connect = ConnectionService();



  Future<void> getSettingData() async {

    if(await _connect.isInternetConnected()){
      if(settingUrlModel == null){
        emit(GetSettingDataLoading());
        await Future.delayed(const Duration(seconds: 1));

        await DioHelper.getData(

          url: EndPoints.setting_request,

        ).then((value) {

          settingUrlModel = SettingModel.formJson(value.data);
          emit(GetSettingDataSuccess());
        }).catchError((error) {
          print(error.toString());
          emit(GetSettingDataError());
        });
      }
    }
    else
      {
        emit(NoInternetConnection());
      }


  }


  Future<void> getTosData() async {

    if(await _connect.isInternetConnected()){
      if(tosModel == null){
        emit(GetTosLoading());
        await Future.delayed(const Duration(seconds: 1));

        await DioHelper.getData(

          url: EndPoints.tos_request,

        ).then((value) {
          tosModel = TosModel.formJson(value.data);
          emit(GetTosSuccess());
        }).catchError((error) {
          print(error.toString());
          emit(GetTosError());
        });
      }
    }
    else
    {
      emit(NoInternetConnection());
    }

  }


  Future<void> getAboutUsData() async {

    if(await _connect.isInternetConnected()){

      if(aboutUsModel == null){
        emit(GetAboutUsLoading());
        await Future.delayed(const Duration(seconds: 1));

        await DioHelper.getData(

          url: EndPoints.about_request,

        ).then((value) {

          aboutUsModel = AboutUsModel.formJson(value.data);
          emit(GetAboutUsSuccess());
        }).catchError((error) {
          print(error.toString());
          emit(GetAboutUsError());
        });
      }

    }
    else
    {
      emit(NoInternetConnection());
    }


  }




}
