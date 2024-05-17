import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';


import '../../../../core/globle/color/dark_app_color.dart';

class GetStarted extends StatelessWidget {

  const GetStarted({super.key});

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
                      'Your Health is Good With TriCare',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: (){



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
                      child:  Text('Book'),
                    ),

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
              child: Image.asset(
                'assets/images/intro.png',
              ),
            ),
          ),

        ],
      ),

    );
  }
}
