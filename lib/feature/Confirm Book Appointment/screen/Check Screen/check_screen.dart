import 'package:awesome_icons/awesome_icons.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:tricare_patient_application/core/InputField/validation/input_validator.dart';
import 'package:tricare_patient_application/core/component/Loading%20Button/loading_button.dart';
import 'package:tricare_patient_application/core/component/TextField/text_form_field.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Circle%20Image/build_circle_image.dart';
import 'package:tricare_patient_application/core/widgets/Down%20Button%20Stack/down_button_stack.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/cubit/confirm_book_cubit.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/model/cart_model.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/screen/Check%20Screen/widget/date_time_widget.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/screen/Check%20Screen/widget/fees_widget.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/screen/Check%20Screen/widget/location_widget.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/screen/Check%20Screen/widget/top_widget.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/screen/Success%20Confirm%20Screen/success_confirm_screen.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/component/SVG/svg.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/utils/utils.dart';
import '../../../../generated/l10n.dart';

class CartScreen extends StatefulWidget {
  final CartModel cartModel;

  const CartScreen({super.key, required this.cartModel});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    getUserData();
  }

  void getUserData() {
    nameController.text = context.read<ProfileCubit>().nameController.text;
    phoneController.text = context.read<ProfileCubit>().phoneController.text;
  }

  void onChangeCheckBook(bool? value) {
    setState(() {
      anotherPerson = value!;
      if (anotherPerson) {
        nameController.clear();
        phoneController.clear();
      } else {
        getUserData();
      }
    });
  }

  bool anotherPerson = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(S.of(context).confirm),
      ),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopWidget(
                      width: width,
                      height: height,
                      image: widget.cartModel.data!.sessions[0].partnerPic!,
                      name: widget.cartModel.data!.sessions[0].partnerName!,
                      position:
                          widget.cartModel.data!.sessions[0].partnerPosition!,
                      speciality:
                          widget.cartModel.data!.sessions[0].specialtyTitle!,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: BuildIconSvg(
                            name: 'userr.svg',
                            color: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(
                          child: VerticalDivider(
                            thickness: 2,
                            color: AppColor.primaryColor.withOpacity(0.5),
                          ),
                          height: height * 0.25,
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      child: Checkbox(
                                        value: anotherPerson,
                                        onChanged: onChangeCheckBook,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      scale: 1.2,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S.of(context).iamBookingToAnotherPatient,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: AppColor.primaryColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: width * 0.7,
                                  child: BuildTextField(
                                    controller: nameController,
                                    hintText: S.of(context).enterFullName,
                                    label: S.of(context).fullName,
                                    valid: InputValidator(context).nameValidator,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.7,
                                  child: BuildTextField(
                                    controller: phoneController,
                                    hintText: S.of(context).enterPhoneNumber,
                                    label: S.of(context).phone,
                                    valid: InputValidator(context).phoneValidator,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    DateTimeWidget(
                      width: width,
                      height: height,
                      date: widget.cartModel.data!.sessions[0].sessionDate!,
                      time: convertTo12HourFormat(widget.cartModel.data!.sessions[0].sessionStart!,Intl.getCurrentLocale()),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    LocationWidget(
                      width: width,
                      height: height,
                      location: context.read<DoctorCubit>().selectBranchName,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Divider(
                      color: AppColor.primaryColor.withOpacity(0.3),
                      thickness: 2,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    FeesWidget(
                      width: width,
                      height: height,
                      price: widget.cartModel.data!.sessions[0].sessionPrice!.toString(),
                      priceAfterDiscount: widget.cartModel.data!.sessions[0].sessionDiscount!.toString(),
                    ),
                  ],
                ),
              ),
            ),
            DownButtonStack(
              width: width,
              height: height,
              button: BlocListener<ConfirmBookCubit, ConfirmBookState>(
                listenWhen: (previous,current)=> previous.checkStatus != current.checkStatus,
                listener: (context, state) async {
                  switch(state.checkStatus){
                    case Status.success:
                      if(context.read<ConfirmBookCubit>().checkModel!.hasError == true){
                        var snackBar = Utils.buildSnackBar2(
                            contentType: ContentType.failure,
                            context: context,
                            message: context.read<ConfirmBookCubit>().checkModel!.errors.join(' '));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else
                      {



                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        
                        context.read<SessionCubit>().getSession(page: 1);

                        navigateTo(context, SuccessConfirmScreen());



                      }
                    default:
                      return;


                  }

                },
                child: LoadingButton(
                  text: S.of(context).confirm,
                  onTap: (startLoading, stopLoading, btnState) async {
                    if (formKey.currentState!.validate()) {
                      if (btnState == ButtonState.idle) {
                        startLoading();
                       await context.read<ConfirmBookCubit>().postCheck(
                              slotId:  context.read<ConfirmBookCubit>().cartModel!.data!.sessions[0].slotid.toString(),
                               session_other: anotherPerson? 1:0,
                               name: nameController.text.trim(),
                               phone: phoneController.text.trim(),
                            );
                        stopLoading();
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
