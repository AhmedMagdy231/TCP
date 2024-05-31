import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Container%20Widget/build_container_widget.dart';

import '../../../../core/component/components.dart';

class BuildLoadingShimmerWidget extends StatelessWidget {
  const BuildLoadingShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BuildShimmer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    BuildContainer(height: height*0.02,width: width*0.6,),
                    BuildContainer(height: height*0.02,width: width*0.3,),




                  ],
                ),
              ),


              BuildContainer(height: height*0.05),
              SizedBox(height: height*0.05,),
              BuildContainer(height: height*0.2,),

              SizedBox(height: height*0.03,),
              BuildContainer(height: height*0.02,width: width*0.4,),

              SizedBox(height: height*0.03,),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns


                  ),
                  itemCount: 8,
                  itemBuilder: (context,index){
                    return  Column(
                      children: [
                        Expanded(
                          child: Card(
                            child: SizedBox(
                              width: width,

                            ),
                          ),
                        ),
                        BuildContainer(height: height*0.02,width: width*0.2,),
                      ],
                    );
                  }
              ),

              SizedBox(height: height*0.03,),
              BuildContainer(height: height*0.02,width: width*0.4,),

              SizedBox(height: height*0.03,),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: height * 0.2,
                        width: width * 0.5,
                        child: Card(),
                      );
                    }),
              ),

              SizedBox(height: height*0.03,),


            ],
          ),
        ),
      ),
    );
  }
}
