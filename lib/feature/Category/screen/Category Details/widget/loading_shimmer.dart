import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/components.dart';

import '../../../../../core/widgets/Show Rate/show_rate.dart';


class LoadingSimmerWidget extends StatelessWidget {
  const LoadingSimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  ListView.builder(

        itemCount: 20,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.015,vertical: height*0.005),
            child: SizedBox(
              height: height * 0.15,
              width: width,
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildShimmer(
                    child: Row(
                      children: [
                       Container(
                         height: height*0.15,
                         width:  height*0.15,

                         decoration: BoxDecoration(
                           color: Colors.grey,
                           borderRadius: BorderRadius.circular(8),
                         ),
                       ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  'Loading...',
                                  style: Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                Text(
                                  'Loading...',
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: height*0.015,),

                                Row(
                                  children: [
                                    const ShowRateStar(
                                        rate:  '5'
                                    ),
                                    const Spacer(),
                                    Text(
                                       'Loading...',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(

                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

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
            ),
          );
        },

    );
  }
}
