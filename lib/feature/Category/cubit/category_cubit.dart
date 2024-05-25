import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Category/model/category_details_model.dart';
import 'package:tricare_patient_application/feature/Category/model/category_model.dart';

import '../../Doctor/model/doctor_details_model.dart';


part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());

  final _connect = ConnectionService();

  int sortBy = 0 ;
  int pageNumber =1;
  String sortByApi = '';

  CategoryModel? categoryModel;
  CategoryDetailsModel? categoryDetailsModel;
  DoctorDetailsModel? doctorDetailsModel;

  List<Specialties>? filterSpecialties;


  Future<void> getCategoryData()async{

    emit(state.copyWith(categoryStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));


    if(await _connect.isInternetConnected()){


      await DioHelper.getData(
        url: EndPoints.category_request,
      ).then((value){
        categoryModel = CategoryModel.formJson(value.data);
        if(categoryModel!.hasError == false){

          filterSpecialties = categoryModel!.data!.specialties;
        }
        emit(state.copyWith(categoryStatus: Status.success));
      }).catchError((error){
        print(error.toString());
        emit(state.copyWith(categoryStatus: Status.failure));
      });
    }
    else
    {
      emit(state.copyWith(categoryStatus: Status.noInternet));
    }



  }

  Future<void> searchAtSpecialties(String value) async {

    if(categoryModel != null){
      filterSpecialties = categoryModel!.data!.specialties!.where(
              (element) => element.specialtyTitle!.toLowerCase().contains(value.toLowerCase())
      ).toList();
    }
    emit(state.copyWith(categoryStatus: Status.loading));
    emit(state.copyWith(categoryStatus: Status.success));

  }


  Future<void> getCategoryDetails({required  id})async {

    categoryDetailsModel = null;

    emit(state.copyWith(categoryDetailsStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(await _connect.isInternetConnected()){

      DioHelper.postData(
        data: {
          'type' : 'specialty',
          'id' : id,
        },

        url: EndPoints.category_request,
      ).then((value) {

        categoryDetailsModel = CategoryDetailsModel.fromJson(value.data);


        emit(state.copyWith(categoryDetailsStatus: Status.success));

      }).catchError((error){
        print(error.toString());
        emit(state.copyWith(categoryDetailsStatus: Status.failure));
      });
    }
    else{
      emit(state.copyWith(categoryDetailsStatus: Status.noInternet));
    }



  }










}
