import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/components.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Container%20Widget/build_container_widget.dart';

import '../../../../../core/globle/color/light_app_color.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/widgets/Build Circle Image/build_circle_image.dart';
import '../../../../../core/widgets/Show Rate/show_rate.dart';



class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return   BuildShimmer(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            mainAxisExtent: height * 0.25,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color:  AppColor.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            
            );
          }),
    );
  }



}
