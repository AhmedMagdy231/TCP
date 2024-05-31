import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/TextField/text_form_field.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Circle%20Image/build_circle_image.dart';
import 'package:tricare_patient_application/core/widgets/Star%20Review%20Widget/star_review_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/utils/utils.dart';

class AddReviewWidget extends StatelessWidget {
  final String name;
  final String image;
  final String position;
  final String speciality;
  final String id;

  const AddReviewWidget({
    super.key,
    required this.name,
    required this.image,
    required this.position,
    required this.speciality,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BuildBottomSheetRateWidget(
              name: name,
              image: image,
              position: position,
              speciality: speciality,
              id: id,
            );
          },
        );
      },
      child: Text(
        'Add Review',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColor.primaryColor,
            ),
      ),
    );
  }
}

class BuildBottomSheetRateWidget extends StatefulWidget {
  final String name;
  final String image;
  final String position;
  final String speciality;
  final String id;

  const BuildBottomSheetRateWidget({
    super.key,
    required this.name,
    required this.image,
    required this.position,
    required this.speciality,
    required this.id,
  });

  @override
  State<BuildBottomSheetRateWidget> createState() =>
      _BuildBottomSheetRateWidgetState();
}

class _BuildBottomSheetRateWidgetState
    extends State<BuildBottomSheetRateWidget> {
  late TextEditingController reviewController;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.03,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Rate Doctor',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: height * 0.02),
                  BuildCircleImage(
                    image: widget.image,
                    width: width * 0.2,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${widget.speciality} & ${widget.position}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  SizedBox(height: height * 0.05),
                  StarWidget(
                    initialRating: 0,
                    size: 40,
                  ),
                  SizedBox(height: height * 0.02),
                  Form(
                    key: formKey,
                    child: BuildTextFormField(
                      controller: reviewController,
                      hintText: 'Write your review...',
                      maxLines: 5,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Review';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  BlocConsumer<DoctorCubit, DoctorState>(
                    buildWhen: (previous,current)=> previous.addReviewStatus != current.addReviewStatus,
                    listenWhen: (previous,current)=> previous.addReviewStatus != current.addReviewStatus,
                    listener: (context, state) {
                      if(state.addReviewStatus == Status.success)
                      {
                        if (context.read<DoctorCubit>().addReviewModel!.hasError) {
                          var snackBar = Utils.buildSnackBar2(
                            contentType: ContentType.failure,
                            context: context,
                            message: context.read<DoctorCubit>().addReviewModel!.errors.join(' '),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else {

                          Navigator.pop(context);

                          var snackBar = Utils.buildSnackBar2(
                              contentType: ContentType.success,
                              context: context,
                              message: context.read<DoctorCubit>().addReviewModel!.messages.join(' '),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);


                        }
                      }
                    },
                    builder: (context, state) {
                      switch (state.addReviewStatus) {
                        case Status.initial || Status.success:
                          return SizedBox(
                            width: width,
                            height: height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  context.read<DoctorCubit>().addReview(
                                        id: widget.id,
                                        reviewStar:  context.read<DoctorCubit>().ratingReview.toString(),
                                        reviewText: reviewController.text.trim(),
                                      );
                                }
                              },
                              child: Text('Send'),
                            ),
                          );
                        case Status.loading:
                          return CircularProgressIndicator();
                        default:
                          return SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reviewController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reviewController.dispose();
  }
}
