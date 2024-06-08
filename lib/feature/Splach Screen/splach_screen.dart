import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/feature/Introduction/On%20Boarding%20Screen/onboarding_screen.dart';
import '../../../../core/functions/fucntions.dart';
import '../HomeLayout/screens/home_layout_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.ease,
    );

    _animationController!.addListener(() {
      if (_animationController!.isCompleted) {
        //    navigateToToFinish(context, widget.FirstScreen);
        navigateToToFinish(context, goToScreen());
      }
    });

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget goToScreen(){

     if(CashHelper.getData(key: 'first') == null) return OnBoardingScreen();

    return HomeLayoutScreen();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: _animation!.value * width * 0.6,
                    height: _animation!.value * width * 0.6,
                  ),
                ),

                Text(
                  'Your Health Is Good With TriCare',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!

                      .copyWith(color: AppColor.primaryColor),
                ).animate().fadeIn()
                .then(delay: 1500.ms) // baseline=800ms
                .fade(),
              ],
            );
          },
        ),
      ),
    );
  }
}
