import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Sessions/model/session_details_model.dart';
import 'package:tricare_patient_application/feature/Sessions/model/session_model.dart';

import '../../../core/constant/constant.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionState());

  SessionModel? sessionModel;
  SessionDetailsModel? sessionDetailsModel;
  final _connect = ConnectionService();

  Future<void> getSession({required int page})async{

    emit(state.copyWith(sessionStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(! await _connect.isInternetConnected()) return emit(state.copyWith(sessionStatus: Status.noInternet));



    await DioHelper.postData(
        data: {
         'page' : page,
        },
        url: EndPoints.session_request,
        token: CashHelper.getData(key: 'token'),
    ).then((value){
       sessionModel = SessionModel.fromJson(value.data);
       emit(state.copyWith(sessionStatus: Status.success));
    }).catchError((error){

      debugPrint(error.toString());
      emit(state.copyWith(sessionStatus: Status.failure,callback: error.toString()));

    });

  }


  Future<void> getSessionDetails({required String id})async{

    emit(state.copyWith(sessionDetailsStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(! await _connect.isInternetConnected()) return emit(state.copyWith(sessionDetailsStatus: Status.noInternet));



    await DioHelper.postData(
      data: {
        'id' : id,
      },
      url: EndPoints.session_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){
      sessionDetailsModel = SessionDetailsModel.fromJson(value.data);
      emit(state.copyWith(sessionDetailsStatus: Status.success));
    }).catchError((error){

      debugPrint(error.toString());
      emit(state.copyWith(sessionDetailsStatus: Status.failure,callback: error.toString()));

    });

  }









}
