import 'package:flutter/material.dart';

import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../core/widgets/Build Circle Image/build_circle_image.dart';


class TopWidget extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String name;
  final String position;
  final String speciality;

  const TopWidget({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.name,
    required this.position,
    required this.speciality

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildCircleImage(
            image:
            image,
            width: width * 0.25,
          ),
          SizedBox(
            height: height*0.01,
          ),

          Text(
            '${name}',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          Text(
            '${speciality} - ${position}',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey
            ),
          ),

          SizedBox(
            height: height*0.01,
          ),

          Divider(
            color: AppColor.primaryColor.withOpacity(0.3),
            thickness: 2,
          ),


        ],
      ),
    );
  }
}