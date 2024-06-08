import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/Login/login_screen.dart';

import '../../../../core/component/ElevatedButton Widget/build_elevated_button.dart';
import '../../../HomeLayout/screens/home_layout_screen.dart';

class BuildDownContainer extends StatelessWidget {
  final String title;
  final String description;

  const BuildDownContainer({super.key, required this.title, required this.description});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: height * 0.6),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.06,
            top: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            BuildButton(
              text: 'Login',
              onPressed: () {
                navigateTo(context, LoginScreen());
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width,
              child: OutlinedButton(
                onPressed: () {
                  CashHelper.prefs.setBool('first', false);
                  navigateToToFinish(context, HomeLayoutScreen());
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Continue as a guest'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
