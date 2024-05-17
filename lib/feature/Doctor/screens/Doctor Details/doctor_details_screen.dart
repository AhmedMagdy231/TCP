import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/feature/Category/model/doctor_details_model.dart';

import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/doctor_details_widget.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import 'widget/loading_shimmer.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String id;

  const DoctorDetailsScreen({super.key, required this.id});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        context.read<DoctorCubit>().backDoctorDetailsScreen();
        print('hereeeeeee');

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Doctor Details',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            var cubit = context.read<DoctorCubit>();
            switch (state.doctorDetailsStatus) {
              case Status.initial:
              case Status.loading:
                return const LoadingShimmerWidget();
              case Status.success:
                return DoctorDetailsWidget(
                  doctorDetailsModel: cubit.doctorDetailsModel,
                );
              case Status.noInternet:
                return NoInternetWidget(onPressed: () {
                  cubit.getDoctorDetails(id: widget.id);
                });
              default:
                return const Icon(Icons.error);
            }
          },
        ),
      ),
    );
  }
}
