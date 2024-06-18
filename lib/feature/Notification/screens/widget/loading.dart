import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/components.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Container%20Widget/build_container_widget.dart';

class LoadingShimmerNotification extends StatelessWidget {
  const LoadingShimmerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildShimmer(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          
          return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildContainer(height: height*0.02 ,width: width*0.7,),
                      Row(
                        children: [
                          BuildContainer(height: height*0.02 ,width: width*0.2,),
                          SizedBox(width: width*0.02,),
                          BuildContainer(height: height*0.02 ,width: width*0.2,),

                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                ),
              ],
            ),
          );
          
        },
      ),
    );
  }
}
