import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tricare_patient_application/core/connection/internet_connection.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Bookmark/model/bookmark_model.dart';
import 'package:tricare_patient_application/feature/Bookmark/model/change_bookmark_model.dart';

part 'book_mark_state.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkState());


  BookmarkModel? bookmarkModel;
  ChangeBookmarkModel? changeBookmarkModel;

  void refreshPage(){
    emit(state.copyWith());
  }

  final _connect = ConnectionService();


  Future<void> getBookmarkData() async {

    emit(state.copyWith(bookmarkStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    await DioHelper.postData(
        data: {
          'page' : 1
        },
        url: EndPoints.doctor_bookmark_request,
    );

  }


  Future<void> changeBookmark({required String id, required String action}) async {

    emit(state.copyWith(changeBookmarkStatus: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    await DioHelper.postData(
      data: {
        'id' : id,
        'action': action,
      },
      url: EndPoints.doctor_bookmark_request,
      token: CashHelper.getData(key: 'token'),
    ).then((value){

      changeBookmarkModel = ChangeBookmarkModel.fromJson(value.data);
      emit(state.copyWith(changeBookmarkStatus: Status.success));

    }).catchError((error){

      print(error.toString());
      emit(state.copyWith(changeBookmarkStatus: Status.failure,callback: error.toString()));

    });

  }



}
