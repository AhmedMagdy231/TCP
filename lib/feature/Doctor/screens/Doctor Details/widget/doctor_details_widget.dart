import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Doctor/model/doctor_details_model.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/about_doctor_widget.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/widget/add_review_widget.dart';
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
                    name: doctorDetailsModel!.data!.partner!.partnerName!,
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

                  Card(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                      child: Row(
                        children: [

                          Icon(Icons.wallet,color: AppColor.primaryColor,size: 25),
                          SizedBox(width: 2,),

                          Text(
                            'consultation fees',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(width: 5,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${int.parse(doctorDetailsModel!.data!.partner!.partnerSessionPrice!)- int.parse(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!)}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              if(hasDiscount(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!))
                                SizedBox(width: 5,),
                              if(hasDiscount(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!))
                                Text(
                                  '${doctorDetailsModel!.data!.partner!.partnerSessionPrice!}',
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),




                            ],
                          ),
                          Spacer(),
                          if(hasDiscount(doctorDetailsModel!.data!.partner!.partnerSessionDiscount!))
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: 2),
                              margin: EdgeInsets.only(bottom: height*0.005),
                              child: Text(
                                '${calculateDiscountPercentage(doctorDetailsModel!.data!.partner!.partnerSessionPrice!, doctorDetailsModel!.data!.partner!.partnerSessionDiscount!)}%',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: width * 0.06,
                  ),

                  if(doctorDetailsModel!.data!.partner!.partnerDescription!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),

                  SizedBox(
                    height: width * 0.05,
                  ),

                  if(doctorDetailsModel!.data!.partnersReviews.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Review',
                            style: Theme.of(context).textTheme.titleLarge,

                          ),
                          const Spacer(),

                      AddReviewWidget(
                        name: doctorDetailsModel!.data!.partner!.partnerName!,
                        image: doctorDetailsModel!.data!.partner!.partnerPic!,
                        position: doctorDetailsModel!.data!.partner!.partnerPosition!,
                        speciality: doctorDetailsModel!.data!.partner!.specialtyTitle!,
                        id:  doctorDetailsModel!.data!.partner!.partnerid!,

                      ),
                        ],
                      ),
                      SizedBox(
                        height: width * 0.01,
                      ),
                      DoctorReviewWidget(
                          height: height,
                          width: width,
                          reviews: doctorDetailsModel!.data!.partnersReviews,
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                    ],
                  ),

                  if(doctorDetailsModel!.data!.similarPartners.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Similar Doctor',
                        style: Theme.of(context).textTheme.titleLarge,

                      ),
                      SizedBox(
                        height: width * 0.01,
                      ),
                      SimilarDoctorWidget(
                        similarDoctor:  doctorDetailsModel!.data!.similarPartners,


                      ),
                    ],
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
