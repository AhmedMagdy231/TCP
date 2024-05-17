import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/widgets/Carousel%20Widget/build_list_title.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/Login/login_screen.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/profile_screen.dart';

import '../../../../core/utils/utils.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            BuildListTitle(
              text: 'Profile',
              iconName: 'user.svg',
              function: () {
                navigateTo(context, ProfileScreen());
              },
            ),
            BuildListTitle(
              text: 'Setting',
              iconName: 'setting.svg',
              function: () {},
            ),
            BuildListTitle(
              text: 'Favorite',
              iconName: 'favorite.svg',
              function: () {},
            ),

            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return BuildListTitle(
                  text: CashHelper.getData(key: 'login') == null
                      ? 'Login'
                      : 'Log out',
                  iconName: CashHelper.getData(key: 'login') == null
                      ? 'login.svg'
                      : 'logout.svg',
                  function: () {
                    if (CashHelper.getData(key: 'login') == null) {
                      navigateTo(context, LoginScreen());
                    }
                    else {
                      var snackBar = Utils.buildSnackBar2(
                        context: context,
                        contentType: ContentType.success,

                        message: 'Logout Successfully',
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      context.read<ProfileCubit>().logOut();
                    }
                  },
                );
              },
            ),
          ],
        ));
  }
}
