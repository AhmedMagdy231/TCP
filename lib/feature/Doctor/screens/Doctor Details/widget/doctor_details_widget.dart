import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Doctor/model/doctor_details_model.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/about_doctor_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/book_appointment_button.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/doctor_review.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/name_position_top_Widget.dart';
import '../../../../../core/globle/color/light_app_color.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/widgets/Build Circle Image/build_circle_image.dart';
import 'smiliar_doctor_widget.dart';

class DoctorDetailsWidget extends StatelessWidget {
  final DoctorDetailsModel? doctorDetailsModel;

  const DoctorDetailsWidget({super.key, required this.doctorDetailsModel});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: width,
          height: height*0.5,
          color: AppColor.primaryColor,
        ),
        Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(top: width * 0.15,bottom: height*0.1),
          padding: EdgeInsets.only(top: width*0.18),
          decoration: const BoxDecoration(
            color: LightAppColor.backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  NamePositionTopWidget(
                    name: doctorDetailsModel!.data!.partner!.partnerFullname!,
                    position: doctorDetailsModel!.data!.partner!.partnerPosition!,
                    rate: doctorDetailsModel!.data!.partner!.partnerReviewsAvg!,
                  ),


                  SizedBox(
                    height: width * 0.06,
                  ),
                  AboutDoctorWidget(
                    rate: doctorDetailsModel!.data!.partner!.partnerReviewsAvg!,
                    review: doctorDetailsModel!.data!.partner!.partnerReviewsTotal!,
                    numberOfPatient: '1200',
                    experience: '2',
                  ),


                  SizedBox(
                    height: width * 0.06,
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Text(
                    cleanHtmlToPlainText(doctorDetailsModel!.data!.partner!.partnerDescription!,maxLength: 200),
                    style:   Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey.shade800,
                      ),
                    maxLines: 5,

                  ),

                  SizedBox(
                    height: width * 0.05,
                  ),

                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Review',
                        style: Theme.of(context).textTheme.titleLarge,

                      ),
                      const Spacer(),
                      InkWell(
                        onTap: (){},
                        child: Text(
                          'Add Review',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.primaryColor,
                          ),


                        ),

                      )
                    ],
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  DoctorReviewWidget(
                      height: height,
                      width: width,
                      reviews: doctorDetailsModel!.data!.partnersReviews!,
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),

                  Text(
                    'Similar Doctor',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  SimilarDoctorWidget(
                    similarDoctor:  doctorDetailsModel!.data!.similarPartners!,


                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),



                ],
              ),
            ),
          ),
        ),
        buildContainerImage(width,doctorDetailsModel!.data!.partner!.partnerPic!),
       BookAppointmentButton(width: width, height: height),
      ],
    );
  }

  Container buildContainerImage(double width,String image) {
    return Container(
      padding: EdgeInsets.all(width * 0.01),
      decoration: const BoxDecoration(
        color: LightAppColor.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: BuildCircleImage(
        image: image,
        width: width * 0.3,
      ),
    );
  }
}
