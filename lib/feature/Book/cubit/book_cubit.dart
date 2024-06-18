import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Doctor/model/add_review_model.dart';
import 'package:tricare_patient_application/feature/Book/model/branch_model.dart';
import 'package:tricare_patient_application/feature/Doctor/model/date_model.dart';
import 'package:tricare_patient_application/feature/Doctor/model/time_model.dart';

import '../../../core/constant/constant.dart';
import '../../../core/network/Local/CashHelper.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());



  AddReviewModel? addReviewModel;
  BranchModel? branchModel;
  int selectIndex = -1;

  final _connect = ConnectionService();



  Future<void> getBranches({required String doctorId})async{

    emit(state.copyWith(branchState: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(! await _connect.isInternetConnected()) return emit(state.copyWith(branchState: Status.noInternet));



    await DioHelper.postData(
      data: {
       // 'doctorid' : doctorId,
      },
      url: EndPoints.branch_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){

       branchModel = BranchModel.fromJson(value.data);
      emit(state.copyWith(branchState: Status.success));
    }).catchError((error){

      debugPrint(error.toString());
      emit(state.copyWith(branchState: Status.failure,callback: error.toString()));

    });

  }




}




