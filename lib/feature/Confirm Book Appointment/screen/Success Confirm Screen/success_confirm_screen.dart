import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Book/screen/book_screen.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/screens/home_layout_screen.dart';

import '../../../../core/widgets/Down Button Stack/down_button_stack.dart';
import '../../../../generated/l10n.dart';

class SuccessConfirmScreen extends StatelessWidget {
  final bool edit;

  const SuccessConfirmScreen({super.key, this.edit = false});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: height,

        child: Stack(
          children: [
            SizedBox(
              height: height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width,
                  ),
                  SizedBox(
                    height: width * 0.5,
                    width: width * 0.5,
                    child: Image.asset('assets/images/success.png'),
                  ),

                  SizedBox(height: height*0.05,),

                  Text(
                   edit? S.of(context).sessionInformationWasSuccessfullyEdited: S.of(context).thanksForBooking,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                 SizedBox(height: height*0.01,),
                  Text(
                    S.of(context).hopeYouGetBetterSoon,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey
                    ),
                  ),

                  SizedBox(height: height*0.2,),
                ],
              ),
            ),

            DownButtonStack(
              width: width,
              height: height,
              button: ElevatedButton(
                onPressed: () {

                Navigator.of(context).pop();
                navigateTo(context, BookScreen(comeFromHomeLayout: false,));

                },
                child: Text(S.of(context).goToMyBooking),
                style: ElevatedButton.styleFrom(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
