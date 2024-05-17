import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Order/model/order_details.dart';
import 'package:tricare_patient_application/feature/Order/model/order_model.dart';

import '../../../core/constant/constant.dart';

part 'order_state.dart';


class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState());

  final _connect = ConnectionService();
  OrderModel? orderModel;
  OrderDetailsModel? orderDetailsModel;


  Future<void> getOrders({required int page})async{

    emit(state.copyWith(orderStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(! await _connect.isInternetConnected()) return emit(state.copyWith(orderStatus: Status.noInternet));

      await DioHelper.postData(
        data: {
          'page' : page,
        },
        url: EndPoints.orders_request,
        token: CashHelper.getData(key: 'token'),
      ).then((value){

        orderModel = OrderModel.fromJson(value.data);
        emit(state.copyWith(orderStatus: Status.success));

      }).catchError((error){

        debugPrint(error.toString());
        emit(state.copyWith(orderStatus: Status.failure,callback: error.toString()));


      });





  }


  Future<void> getOrdersDetails({required String id,required String paymentSuccess})async{

    emit(state.copyWith(orderDetailsStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(! await _connect.isInternetConnected()) return emit(state.copyWith(orderDetailsStatus: Status.noInternet));

    await DioHelper.postData(
      data: {
        'id' : id,
        'payment_success' : paymentSuccess,
      },
      url: EndPoints.orders_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){

      orderDetailsModel = OrderDetailsModel.fromJson(value.data);
      emit(state.copyWith(orderDetailsStatus: Status.success));

    }).catchError((error){

      debugPrint(error.toString());
      emit(state.copyWith(orderDetailsStatus: Status.failure,callback: error.toString()));


    });


  }



}
