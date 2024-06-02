import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../generated/l10n.dart';

class GreatPerson extends StatelessWidget {
  const GreatPerson({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              var cubit = context.read<ProfileCubit>();
              return Text(
                '${S.of(context).hello} ${cubit.userModel == null?'':cubit.userModel!.hasError?'': cubit.userModel!.data!.patient!.patientFullname} 👋',
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),
          Text(
            S.of(context).welcomeToTricare,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
