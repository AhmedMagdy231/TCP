import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Book/model/add_review_model.dart';
import 'package:tricare_patient_application/feature/Doctor/model/date_model.dart';
import 'package:tricare_patient_application/feature/Doctor/model/time_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());



  AddReviewModel? addReviewModel;
  final _connect = ConnectionService();






  Future<void> addReview({
    required String id,
    required String reviewStar,
    required String reviewTitle,
    required String reviewText,
  }) async{

    if(await _connect.isInternetConnected()){
      emit(GetAddReviewLoading());
      await DioHelper.postData(
        data: {
          'id' : id,
          'review_stars' : reviewStar,
          'review_title' : reviewTitle,
          'review_txt' : reviewText,
        },
        url: EndPoints.doctor_review,
      ).then((value){

        addReviewModel = AddReviewModel.formJson(value.data);
        emit(GetAddReviewSuccess());

      }).catchError((error){
        debugPrint(error.toString());
        emit(GetAddReviewError());
      });
    }
    else
      {
        emit(NoInternetConnection());
      }



  }

}




