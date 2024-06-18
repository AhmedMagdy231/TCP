import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/Login/login_screen.dart';

import '../../../generated/l10n.dart';


class BuildLoginFirst extends StatelessWidget {
  final double heightImage;
  final double widthImage;
  final double height;
  final double width;
  final bool onDialog;

  const BuildLoginFirst({super.key,this.onDialog = false, required this.heightImage, required this.widthImage, required this.height, required this.width});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightImage,
              width: widthImage,
              child: Image.asset('assets/images/login.png'),
            ),


            Text(
              S.of(context).loginOrCreateAnAccountFirst,
              style: Theme.of(context).textTheme.titleMedium,

            ),

            SizedBox(height: height*0.01,),

            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: (){
                  if(onDialog) Navigator.pop(context);
                  navigateTo(context, LoginScreen());
                },
                child: Text(S.of(context).login),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
