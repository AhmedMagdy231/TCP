import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Articles/model/article_category_details_model.dart';
import 'package:tricare_patient_application/feature/Articles/model/article_category_model.dart';
import 'package:tricare_patient_application/feature/Articles/model/article_model.dart';

import '../../../core/constant/constant.dart';
import '../../../core/data structure/stack.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleState());

  ArticleCategoryModel? articleCategoryModel;
  ArticlesCategoryDetailsModel? articlesCategoryDetailsModel;
  ArticleModel? articleModel;

  MyStack<ArticleModel> stack = MyStack<ArticleModel>();



  int counter = 0;

  final _connect = ConnectionService();

  void backArticleDetailsScreen() {

    // stack.pop();
    //
    // if( ! stack.isEmpty()) {
    //   emit(state.copyWith(articleDetailsStatus: Status.loading));
    //   articleModel = stack.peek();
    //   emit(state.copyWith(articleDetailsStatus: Status.success));
    //
    // }

    counter--;

  }


  Future<void> getArticleCategoryData()async{

    emit(state.copyWith(articleCategoryStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));


    if(await _connect.isInternetConnected()){


     await DioHelper.getData(
        url: EndPoints.page_request,
      ).then((value){
        articleCategoryModel = ArticleCategoryModel.formJson(value.data);
        emit(state.copyWith(articleCategoryStatus: Status.success));
      }).catchError((error){
        debugPrint(error.toString());
        emit(state.copyWith(articleCategoryStatus: Status.failure));
      });

    }
    else
    {
      emit(state.copyWith(articleCategoryStatus: Status.noInternet));
    }
  }


  Future<void> getArticleCategoryDetailsData({required String id})async{

    emit(state.copyWith(articleCategoryDetailsStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(await _connect.isInternetConnected()){

      await  DioHelper.postData(
        url: EndPoints.page_request,
        data: {
          'type' : 'cat',
          'id' : id,
        },
      ).then((value){
        articlesCategoryDetailsModel = ArticlesCategoryDetailsModel.formJson(value.data);
        emit(state.copyWith(articleCategoryDetailsStatus: Status.success));
      }).catchError((error){
        debugPrint(error.toString());
        emit(ArticleState(articleCategoryDetailsStatus: Status.failure));
      });

    }
    else
    {
      emit(state.copyWith(articleCategoryDetailsStatus: Status.noInternet));
    }
  }


  Future<void> getArticleDetailsData({required String id})async{

    emit(state.copyWith(articleDetailsStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));


    if(await _connect.isInternetConnected()){


      await DioHelper.postData(
        url: EndPoints.page_request,
        data: {
          'type' : 'page',
          'id' : id,
        },
      ).then((value) async {

        articleModel = ArticleModel.formJson(value.data);
   //     stack.push(articleModel!);
        emit(state.copyWith(articleDetailsStatus: Status.success));

      }).catchError((error){
        debugPrint(error.toString());
        emit(state.copyWith(articleDetailsStatus: Status.failure));
      });

    }
    else
    {
      emit(state.copyWith(articleDetailsStatus: Status.noInternet));
    }
  }





}
