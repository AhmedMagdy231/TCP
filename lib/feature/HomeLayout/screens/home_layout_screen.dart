import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/component/SVG/svg.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
import 'package:tricare_patient_application/feature/Book/screen/book_screen.dart';
import 'package:tricare_patient_application/feature/Drawer/screen/drawer_screen.dart';
import 'package:tricare_patient_application/feature/Home/screen/home_screen.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/Notification/screens/notification_screens.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Main%20Profile/main_profile_screen.dart';

import '../../../core/globle/color/shared_color.dart';
import '../../Notification/cubit/notification_cubit.dart';

class HomeLayoutScreen extends StatelessWidget {
  HomeLayoutScreen({Key? key}) : super(key: key);

  List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/book.svg',
    'assets/icons/person.svg',
  ];

  List<String> textNavigationBar = [
    'Home',
    'Book',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (context.read<GlobalCubit>().currentIndexScreen == 0) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      title: Text(
                        'Exit From Application',
                      ),
                      content: Text(
                        'Do you Want to Exit',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: LightAppColor.backgroundColor),
                          child: Text(
                            'Yes',
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: LightAppColor.backgroundColor,
                          ),
                          child: Text(
                            'No',
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                      ],
                    );
                  });
            } else {
              context.read<GlobalCubit>().goToScreenAtIndex(0);
            }
          },
          child: Scaffold(
            drawer: const DrawerScreen(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.08),
              child: AppBar(
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: width * 0.2,
                        width: width * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<NotificationCubit>().getNotification();
                        navigateTo(context, NotificationScreen());
                      },
                      icon: const BuildIconSvg(
                        name: 'notification.svg',
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            body: PageView(
              controller: context.read<GlobalCubit>().homeLayoutController,
              children: [
                HomeScreen(),
                BookScreen(),
                MainProfileScreen(),
              ],
              onPageChanged: (index) {
                context.read<GlobalCubit>().changeSelectedIndexNav(index);
              },
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: 3,

              tabBuilder: (index, isActive) {
                final color = isActive ? AppColor.primaryColor : Colors.grey;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icons[index],
                      color: color,
                      width: 20,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      textNavigationBar[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: color,
                          ),
                    ),
                  ],
                );
              },
              activeIndex: context.read<GlobalCubit>().currentIndexScreen,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.verySmoothEdge,

              leftCornerRadius: 32,
              rightCornerRadius: 32,
              height: height * 0.08,
              onTap: (index) {
                context.read<GlobalCubit>().homeLayoutController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear,
                    );
              },
              //other params
            ),
          ),
        );
      },
    );
  }
}
