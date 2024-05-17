import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/feature/Drawer/screen/widget/login_widget.dart';
import 'package:tricare_patient_application/feature/Drawer/screen/widget/top_widget.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Drawer(
          child: CashHelper.getData(key: 'login') == true?
          cubit.userModel == null ?
          const BuildLoadingWidget() :
          DrawerLoginWidget() :
          SizedBox()
        );
      },
    );
  }
}
