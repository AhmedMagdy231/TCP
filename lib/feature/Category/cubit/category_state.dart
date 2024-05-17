part of 'category_cubit.dart';


 class CategoryState {
   final Status categoryStatus;
   final Status categoryDetailsStatus;

   CategoryState({
     this.categoryStatus = Status.initial,
     this.categoryDetailsStatus = Status.initial,
   });

 CategoryState copyWith({
     Status? categoryStatus,
     Status? categoryDetailsStatus,

 }) => CategoryState(
   categoryDetailsStatus: categoryDetailsStatus?? this.categoryDetailsStatus,
   categoryStatus: categoryStatus?? this.categoryStatus,
 );




}

final class CategoryInitial extends CategoryState {}

class NoInternetConnection extends CategoryState{}

class GetCategoryLoading extends CategoryState{}
class GetCategorySuccess extends CategoryState{}
class GetCategoryError extends CategoryState{}

class GetCategoryDetailsLoading extends CategoryState{}
class GetCategoryDetailsSuccess extends CategoryState{}
class GetCategoryDetailsError extends CategoryState{}


class GetDoctorDetailsLoading extends CategoryState{}
class GetDoctorDetailsSuccess extends CategoryState{}
class GetDoctorDetailsError extends CategoryState{}

class SearchAtSpecialties extends CategoryState{}


