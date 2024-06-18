

 import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../feature/HomeLayout/cubit/app_cubit.dart';
import '../../generated/l10n.dart';
import '../Global Cubit/global_cubit.dart';
import '../widgets/Login First/login_first_widget.dart';

class Utils {

  static void showDialog2({
     required BuildContext context,
     required DialogType dialogType,
     required widget,
     String? action,
   }) => AwesomeDialog(
       dismissOnBackKeyPress: true,
       context: context,
       dialogType: dialogType,
     // dialogBackgroundColor: AppColor.primaryColor,
       animType: AnimType.scale,
       btnOkText: 'okay',
       title: 'Dialog Title',
       body: widget,
       btnOkColor: dialogType == DialogType.success
           ? Colors.green
           : dialogType == DialogType.error
           ? Color(0xffD03B42)
           : Color(0xffFFB61C),
       btnOkOnPress: () {

       },
     ).show();


  static SnackBar buildSnackBar2(
       {
          required ContentType contentType
         , required String message ,
           milSecond =3000,
         required BuildContext context,

       }) {
     return SnackBar(
       duration: Duration(milliseconds: milSecond),
       elevation: 0,
       behavior: SnackBarBehavior.floating,
       backgroundColor: Colors.transparent,
       content: AwesomeSnackbarContent(
         title: contentType == ContentType.success?
         context.read<GlobalCubit>().local == 'en'? 'Success Process':'عملية ناجحة':
         context.read<GlobalCubit>().local == 'en'? 'Failed Process':'عملية غير ناجحة',
         message: message,
         contentType: contentType,
       ),
     );
   }

  static Future<void> showLoadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
 //   barrierColor: Colors.transparent,
    builder: (context) => const LoadingDialog(),
  );


   static buildFirstLoginDialog({required BuildContext context, required double width,required double height}){
     showDialog(
       context: context,

       builder: (context){
         return Dialog(

           elevation: 0,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Padding(
                 padding:  EdgeInsets.symmetric(vertical: height*0.05,horizontal: width*0.03),
                 child: BuildLoginFirst(
                   heightImage: width*0.4,
                   widthImage: width*0.4,
                   height: height,
                   width: width,
                   onDialog: true,
                 ),
               ),
             ],
           ),
         );
       },
     );
   }

   static changeLanguageDialog({required BuildContext context,required double width,required double height}){
     showDialog(
         context: context,
         builder: (context){

           return AlertDialog(

             //surfaceTintColor: DarkAppColor.foreGroundColors,
             title:  Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
                 S.of(context).changeLanguage,
               ),
             ),

             content: StatefulBuilder(
               builder: (BuildContext ctx, StateSetter setState){
                 return Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [


                     RadioListTile(
                       title:  Text(
                         'English',
                         style: Theme.of(context).textTheme.titleMedium,
                       ),
                       value: 1,
                       groupValue: context.read<GlobalCubit>().selectOption,
                       onChanged: (value) {
                         setState(() {
                     context.read<GlobalCubit>().selectOption = value!;
                         });
                       },

                     ),
                     RadioListTile(
                       title:  Text(
                         "العربية",
                         style: Theme.of(context).textTheme.titleMedium,
                       ),

                       value: 2,
                       groupValue: context.read<GlobalCubit>().selectOption,
                       onChanged: (value) {
                         setState(() {
                            context.read<GlobalCubit>().selectOption = value!;
                         });
                       },

                     ),
                     SizedBox(height: height*0.03,),
                     ElevatedButton(

                       onPressed: () async {
                         await  context.read<GlobalCubit>().changeLocal(
                           value: context.read<GlobalCubit>().selectOption,
                         );
                         context.read<AppCubit>().getHomeData();

                         Navigator.pop(ctx);
                       },
                       child: Text(S.of(context).save),
                       style: ElevatedButton.styleFrom(
                         minimumSize: Size(width, height*0.06),
                       ),
                     ),
                   ],
                 );
               },
             ),
           );
         }
     );
   }





 }


 class LoadingDialog extends StatelessWidget {
   const LoadingDialog({super.key});
   @override
   Widget build(BuildContext context) => const Dialog(
     elevation: 0,
     backgroundColor: Colors.transparent,
     child: PopScope(
       canPop: false,
       child: Center(
         child: Card(
           child: Padding(
             padding: EdgeInsets.all(20),
             child: CircularProgressIndicator(),
           ),
         ),
       ),
     ),
   );
 }


