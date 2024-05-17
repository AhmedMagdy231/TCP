import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate/rate.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/doctor_details_screen.dart';


import '../../../../Category/model/doctor_details_model.dart';


class SimilarDoctorWidget extends StatelessWidget {
  final List<SimilarPartners> similarDoctor;
  const SimilarDoctorWidget({super.key,required this.similarDoctor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SizedBox(
      height: height*0.25,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similarDoctor.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              context.read<DoctorCubit>().getDoctorDetails(id: similarDoctor[index].pARTNERID);
              navigateTo(context, DoctorDetailsScreen(id: similarDoctor[index].pARTNERID!));
            },
            child: SizedBox(

              width: width*0.4,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: height*0.15,
                      width: width,
                      child: AspectRatio(
                        aspectRatio: 1/1,
                        child: BuildImage(
                          image: similarDoctor[index].partnerPic!,
                          fit: BoxFit.cover,
                          radius: 12,
                          alignment: true,
                          borderAll: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            similarDoctor[index].partnerName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),

                          Text(
                            similarDoctor[index].partnerPosition!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                            ),
                          ),

                          Rate(
                            iconSize: 15,
                            color: Colors.amber,
                            allowHalf: true,
                            allowClear: true,
                            initialValue: double.parse( similarDoctor[index].partnerReviewsAvg!),
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}
