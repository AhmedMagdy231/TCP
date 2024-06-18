import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/feature/Book/cubit/book_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/Search/screen/search%20by%20all/search_by_all.dart';


import '../../../../core/globle/color/dark_app_color.dart';
import '../../../../generated/l10n.dart';

class GetStarted extends StatelessWidget {
  final String image;
  final String title;


  const GetStarted({super.key,required this.image,required this.title});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      height: height*0.25,
      width: width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: height*0.2,
            width: width,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),

            child: SizedBox(

              width: width*0.57,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: (){
                      context.read<BookCubit>().getBranches(doctorId: '0');

                      navigateTo(context, SearchByAllScreen(
                        specialties: context.read<AppCubit>().homeModel!.data!.specialties!,

                      ));

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(width*0.3, height*0.05),
                          shadowColor: Colors.grey,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      child:  Text(
                          S.of(context).lookingForDoctor,
                         style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  // the for
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: height*0.25,

              width: width*0.4,
              child: Image.network(
                image,
              ),
            ),
          ),

        ],
      ),

    );
  }
}
