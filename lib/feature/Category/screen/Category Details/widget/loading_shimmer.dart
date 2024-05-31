import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/components.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Container%20Widget/build_container_widget.dart';

import '../../../../../core/component/Network Image/network_image.dart';
import '../../../../../core/widgets/Show Rate/show_rate.dart';


class LoadingSimmerWidget extends StatelessWidget {
  const LoadingSimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SizedBox(
      height: height * 0.2,
      width: width,
      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BuildShimmer(
            child: Row(
              children: [
                SizedBox(
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                       BuildContainer(height: height*0.01,width: width*0.6,),
                        SizedBox(height: height*0.0015,),
                       BuildContainer(height: height*0.01,width: width*0.4,),
                        SizedBox(height: height*0.0015,),
                       BuildContainer(height: height*0.01,width: width*0.2,),



                        SizedBox(height: height*0.015,),

                        Row(
                          children: [
                            const ShowRateStar(
                                rate:  '5'
                            ),
                            const Spacer(),
                            BuildContainer(height: height*0.01,width: width*0.15,),

                          ],
                        ),



                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),


      ),
    );
  }
}
