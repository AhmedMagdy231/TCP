import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/functions/fucntions.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../cubit/doctor_cubit.dart';
import '../../../model/time_model.dart';

class ChooseTimeWidget extends StatelessWidget {
  final String doctorId;

  const ChooseTimeWidget({super.key, required this.doctorId});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit,DoctorState>(
        builder: (context,state){
          var cubit = context.read<DoctorCubit>();
          switch (state.timeStatus) {
            case Status.initial:
              return const SizedBox();
            case Status.loading:
              return const LinearProgressIndicator();
            case Status.success:
              return  ChooseTime(
                times: cubit.timeModel!.data!.slots!,
                doctorId: doctorId,
              );
            case Status.noInternet:
              return NoInternetWidget(onPressed: () {

              });
            default:
              return const Icon(Icons.error);
          }
        }
    );
  }
}



class ChooseTime extends StatefulWidget {
  final List<Slots> times;
  final String doctorId;
  const ChooseTime({super.key, required this.times,required this.doctorId});

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  String selectTimeId = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).chooseTime,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        SizedBox(
          height: height * 0.1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.times.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectTimeId = widget.times[index].id!;
                        context.read<DoctorCubit>().selectTimeId = selectTimeId;
                        context.read<DoctorCubit>().changeStepper(3);

                      });


                    },
                    child: Card(
                      color: selectTimeId == widget.times[index].id!
                          ? AppColor.primaryColor
                          : Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child:  Text(
                            maxLines: 1,
                            widget.times[index].text!,
                            style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: selectTimeId ==
                                  widget.times[index].id!
                                  ? Colors.white
                                  : Colors.black,
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