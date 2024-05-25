import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/feature/Doctor/model/doctor_details_model.dart';
import 'package:tricare_patient_application/feature/Doctor/model/date_model.dart';

import '../../../core/data structure/stack.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../model/time_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorState());

  DoctorDetailsModel? doctorDetailsModel;
  DateModel? dateModel;
  TimeModel? timeModel;

  String selectBranchId = '';
  String selectDateId = '';
  String selectTimeId = '';

  String selectBranchName = '';

  int activeStep =0;

  void changeStepper(int step){
    activeStep = step;
    emit(state.copyWith(stepperStatus: Status.success));
  }




  final _connect = ConnectionService();

  MyStack<DoctorDetailsModel> stack = MyStack<DoctorDetailsModel>();

void backDoctorDetailsScreen() {

  stack.pop();

  if( ! stack.isEmpty()) {
    doctorDetailsModel = stack.peek();
    emit(state.copyWith(doctorDetailsStatus: Status.success));

  }

}

void restartBookAppointment(){
  activeStep = 0;
  emit(state.copyWith(dateStatus: Status.initial));
  emit(state.copyWith(timeStatus: Status.initial));
}


Future<void> getDoctorDetails({required  id})async{



    emit(state.copyWith(doctorDetailsStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(await _connect.isInternetConnected()){

      DioHelper.postData(
        data: {
          'type' : 'partner',
          'id' : id,
        },
        url: EndPoints.category_request,
      ).then((value) async {

        doctorDetailsModel = DoctorDetailsModel.formJson(value.data);
        stack.push(doctorDetailsModel!);


        emit(state.copyWith(doctorDetailsStatus: Status.success));

      }).catchError((error){
        print(error.toString());
        emit(state.copyWith(doctorDetailsStatus: Status.failure));
      });
    }
    else {
      emit(state.copyWith(doctorDetailsStatus: Status.noInternet));
    }

  }


Future<void> getDate({required String doctorId, required String sessionBranch}) async {



  emit(state.copyWith(timeStatus: Status.initial));

  emit(state.copyWith(dateStatus: Status.loading));
  await Future.delayed(const Duration(seconds: 1));


  if(await _connect.isInternetConnected()){

      await DioHelper.postData(
        data: {
          'id' : doctorId,
          'session_branch' : sessionBranch

        },
        url: EndPoints.doctor_times,
      ).then((value){
        print(value.data);
        dateModel = DateModel.formJson(value.data);

        emit(state.copyWith(dateStatus: Status.success));

      }).catchError((error){
        debugPrint(error.toString());
        emit(state.copyWith(dateStatus: Status.failure));
      });
    }
    else
    {
      emit(state.copyWith(dateStatus: Status.noInternet));
    }


  }



  Future<void> getTime({required String doctorId, required String branchId, required dateId}) async {

    print(doctorId);
    print(branchId);
    print(dateId);
    emit(state.copyWith(timeStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    if(await _connect.isInternetConnected()){


      await DioHelper.postData(
        data: {
          'id' : doctorId,
          'session_branch' : branchId,
          'session_date' :  dateId,

        },
        url: EndPoints.doctor_times,
      ).then((value){
       print(value.data);


        timeModel = TimeModel.formJson(value.data);
        emit(state.copyWith(timeStatus: Status.success));

      }).catchError((error){
        debugPrint(error.toString());
        emit(state.copyWith(timeStatus: Status.failure));
      });
    }
    else
    {
      emit(state.copyWith(timeStatus: Status.noInternet));
    }


  }









}
