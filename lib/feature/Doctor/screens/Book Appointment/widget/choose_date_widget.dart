import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import '../../../model/date_model.dart';

class ChooseDateWidget extends StatelessWidget {
  final String doctorId;

  const ChooseDateWidget({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(builder: (context, state) {
      var cubit = context.read<DoctorCubit>();
      switch (state.dateStatus) {
        case Status.initial:
          return const SizedBox();
        case Status.loading:
          return const LinearProgressIndicator();
        case Status.success:
          return cubit.dateModel!.hasError
              ? SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      'There aren\'t any available sessions for this partner !',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              : ChooseDate(
                  dates: cubit.dateModel!.data!.dates!,
                  doctorId: doctorId,
                );
        case Status.noInternet:
          return NoInternetWidget(onPressed: () {});
        default:
          return const Icon(Icons.error);
      }
    });
  }
}

class ChooseDate extends StatefulWidget {
  final List<Dates> dates;
  final String doctorId;

  const ChooseDate({super.key, required this.dates, required this.doctorId});

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  String selectDateId = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Date',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.dates.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (selectDateId != widget.dates[index].id!) {
                        setState(() {
                          selectDateId = widget.dates[index].id!;
                          context.read<DoctorCubit>().selectDateId =
                              selectDateId;
                          context.read<DoctorCubit>().changeStepper(2);
                        });

                        context
                            .read<DoctorCubit>()
                            .getTime(doctorId: widget.doctorId);
                      }
                    },
                    child: SizedBox(
                      width: width * 0.2,
                      child: Card(
                        color: selectDateId == widget.dates[index].id!
                            ? AppColor.primaryColor
                            : Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  maxLines: 1,
                                  widget.dates[index].monthName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: selectDateId ==
                                                widget.dates[index].id!
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  maxLines: 1,
                                  widget.dates[index].dayNumber!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: selectDateId ==
                                                widget.dates[index].id!
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
