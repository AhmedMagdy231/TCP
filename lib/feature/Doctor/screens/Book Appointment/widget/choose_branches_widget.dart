import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';

import '../../../../Book/model/branch_model.dart';


class ChooseBranchesWidget extends StatefulWidget {
  final List<Branches> branches;
  final double width;
  final double height;
  final String doctorId;

  const ChooseBranchesWidget(
      {
        super.key,
        required this.doctorId,
      required this.branches,
      required this.width,
      required this.height});



  @override
  State<ChooseBranchesWidget> createState() => _ChooseBranchesWidgetState();
}

class _ChooseBranchesWidgetState extends State<ChooseBranchesWidget> {


  String selectBranchId = '-1';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Branches',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: widget.height * 0.1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.branches.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                     if(selectBranchId != widget.branches[index].branchid!){
                       setState(() {
                         selectBranchId = widget.branches[index].branchid!;
                         context.read<DoctorCubit>().selectBranchName = widget.branches[index].branchName!;

                         context.read<DoctorCubit>().selectBranchId = selectBranchId;
                         context.read<DoctorCubit>().changeStepper(1);

                       });

                       context.read<DoctorCubit>().getDate(
                         doctorId: widget.doctorId,
                         sessionBranch: selectBranchId,
                       );

                     }





                    },
                    child: SizedBox(
                      width: widget.width * 0.4,
                      child: Card(
                        color: selectBranchId == widget.branches[index].branchid!
                            ? AppColor.primaryColor
                            : Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              maxLines: 1,
                              widget.branches[index].branchName!,
                              style:
                                  Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: selectBranchId ==
                                                widget.branches[index].branchid!
                                            ? Colors.white
                                            : Colors.black,
                                      ),
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
