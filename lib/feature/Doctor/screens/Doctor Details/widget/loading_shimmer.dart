import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/components.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Container%20Widget/build_container_widget.dart';

import '../../../../../core/globle/color/light_app_color.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/widgets/Build Circle Image/build_circle_image.dart';
import '../../../../../core/widgets/Show Rate/show_rate.dart';
import 'about_doctor_widget.dart';
import 'book_appointment_button.dart';
import 'name_position_top_Widget.dart';


class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Stack(
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
          margin: EdgeInsets.only(top: width * 0.15,bottom: height*0.0),
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
              child: BuildShimmer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          


                    Center(
                      child: Column(

                        children: [
                          BuildContainer(height: height*0.02, width: width*0.5,),
                          BuildContainer(height: height*0.02, width: width*0.3,),
                          ShowRateStar(rate: '5'),
                        ],
                      ),
                    ),
                          
                          
                    SizedBox(
                      height: width * 0.06,
                    ),
                    const AboutDoctorWidget(
                      rate: '5',
                      review: '500',
                      numberOfPatient: '500',
                      numberOfSessions: '1',
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
                    BuildContainer(height: height*0.02,),
                    BuildContainer(height: height*0.02,),
                    BuildContainer(height: height*0.02,),
                    BuildContainer(height: height*0.02,),
                    BuildContainer(height: height*0.02,),


                    SizedBox(
                      height: width * 0.02,
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
                    SizedBox(
                      height: height*0.22,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return SizedBox(
                            width: width*0.8,
                            child: Card(),
                          );
                        },
                      ),

                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                          
                    // Text(
                    //   'Similar Doctor',
                    //   style: Theme.of(context).textTheme.titleLarge,
                    //
                    // ),
                    // SizedBox(
                    //   height: width * 0.01,
                    // ),
                    //
                    // SizedBox(
                    //   height: width * 0.05,
                    // ),
                          
                          
                          
                  ],
                ),
              ),
            ),
          ),
        ),
        BuildShimmer(child: buildContainerImage(width,'')),

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
        image:
        'https://motherscareivfcentre.com/wp-content/uploads/2015/12/pic-team-1.jpg',
        width: width * 0.3,
      ),
    );
  }

}
