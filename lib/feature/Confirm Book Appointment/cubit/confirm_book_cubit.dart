import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/model/cart_model.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/model/check_Model.dart';

part 'confirm_book_state.dart';

class ConfirmBookCubit extends Cubit<ConfirmBookState> {
  ConfirmBookCubit() : super(ConfirmBookState());

  CartModel? cartModel;
  CheckModel? checkModel;

  final _connect = ConnectionService();

  Future<void> postCart({required String slotId}) async {

    emit(state.copyWith(cartStatus: Status.loading));

    await Future.delayed(const Duration(seconds: 1));

    if (!await _connect.isInternetConnected())
      return emit(state.copyWith(cartStatus: Status.noInternet));

    await DioHelper.postData(
      data: {
        'id' : slotId,
      },
      url: EndPoints.cart_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value) {

      cartModel = CartModel.fromJson(value.data);
      emit(state.copyWith(cartStatus: Status.success));


    }).catchError((error){
      debugPrint(error.toString());
      emit(state.copyWith(cartStatus: Status.failure,callback: error.toString()));
    });
  }


  Future<void> postCheck({
    required String slotId,
    required int session_other,
    String? inv_coupon,

     String? name,
     String? phone,
     String? phone2,
     String? notes,

  }) async {

    emit(state.copyWith(checkStatus: Status.loading));

    await Future.delayed(const Duration(seconds: 1));

    if (!await _connect.isInternetConnected())
      return emit(state.copyWith(checkStatus: Status.noInternet));

    await DioHelper.postData(
      data: {
        'id' : slotId,
        'accept_tos' : '1',
        'session_other' : session_other,
        'inv_coupon' : inv_coupon??'',
        'payment_option' : 'cod',
        'session_fullname' : name?? '',
        'session_phone' : phone?? '',
        'session_phone_2' : phone2?? '',
        'session_notes' : notes?? '',

      },
      url: EndPoints.check_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value) {

      print(value.data);
      checkModel = CheckModel.fromJson(value.data);
      emit(state.copyWith(checkStatus: Status.success));


    }).catchError((error){
      debugPrint(error.toString());
      emit(state.copyWith(checkStatus: Status.failure,callback: error.toString()));
    });
  }

}
