import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/widgets/Show%20Rate/show_rate.dart';

import '../../../../Category/model/doctor_details_model.dart';


class DoctorReviewWidget extends StatelessWidget {
  final height;
  final width;
  final List<PartnersReviews> reviews;
  const DoctorReviewWidget({Key? key,required this.height, required this.width,required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height*0.22,
      child: ListView.builder(
        itemCount: reviews.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return buildItemReview(
            context: context,
            name: reviews[index].patientFullname!,
            image:  reviews[index].patientProfilepicture!,
            date:  reviews[index].reviewDate!,
            title:  reviews[index].reviewTitle!,
            review:  reviews[index].reviewTxt!,
            rate:  reviews[index].reviewStars!,
          );
        },
      ),

    );
  }

  Widget buildItemReview({
    required String name,
    required String image,
    required String date,
    required String title,
    required String review,
    required String rate,
    required BuildContext context,
  }) {
    return SizedBox(
      width: width*0.8,

      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [
                  CircleAvatar(
                    radius: width*0.05,
                    backgroundImage: NetworkImage(image),
                  ),
                  SizedBox(width: width*0.02,),
                  SizedBox(
                    width: width*0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                        ),
                       Text(
                         DateFormat.yMMMMd().format(
                           DateTime.parse(
                             date,
                           ),
                         ),
                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
                           color: Colors.grey,
                         ),
                       ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Rate',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                      ),
                      ShowRateStar(rate: rate,iconSize: 15,),
                    ],
                  ),

                ],
              ),
              SizedBox(height: height*0.005,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                    ),
                    SizedBox(height: height*0.005,),
                    Text(
                        review,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}