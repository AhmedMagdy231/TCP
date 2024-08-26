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



