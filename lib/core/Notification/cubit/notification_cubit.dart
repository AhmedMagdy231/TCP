import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/Notification/model/notification_model.dart';
import 'package:tricare_patient_application/core/Notification/model/notification_read_model.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';

import '../../constant/constant.dart';
import '../../network/endPoind.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState());

  NotificationModel? notificationModel;
  NotificationReadModel? notificationReadModel;

  final _connect = ConnectionService();


  Future<void> getNotification() async {
    emit(state.copyWith(getNotification: Status.loading));
    await Future.delayed(const Duration(seconds: 1));


    if(! await _connect.isInternetConnected()) return   emit(state.copyWith(getNotification: Status.noInternet));

    await DioHelper.postData(
      data: {},
      url: EndPoints.notification_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){
      notificationModel = NotificationModel.formJson(value.data);
      emit(state.copyWith(getNotification: Status.success));
    }).catchError((error){

      debugPrint(error.toString());
      emit(state.copyWith(getNotification: Status.failure,callback: error.toString()));

    });
  }


  Future<void> getNotificationRead({
    required String id
}) async {
    emit(state.copyWith(readNotification: Status.loading));
    await Future.delayed(const Duration(seconds: 1));


    if(! await _connect.isInternetConnected()) return   emit(state.copyWith(readNotification: Status.noInternet));

    await DioHelper.postData(
      data: {
        'id' : id,

      },
      url: EndPoints.notification_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){

      notificationReadModel = NotificationReadModel.formJson(value.data);
      emit(state.copyWith(readNotification: Status.success));

    }).catchError((error){

      debugPrint(error.toString());
      emit(state.copyWith(readNotification: Status.failure,callback: error.toString()));

    });
  }


}
