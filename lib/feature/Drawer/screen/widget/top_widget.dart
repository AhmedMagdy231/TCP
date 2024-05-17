import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../../../../core/globle/color/dark_app_color.dart';


class TopWidget extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final String image;
  final String email;

  const TopWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.email,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height*0.3,
      child: Stack(
        children: [
          SizedBox(
              height: height*0.3,
              width: width,
              child: Image.asset('assets/images/drawer5.jpg',fit: BoxFit.cover,)),
          Container(
            height: height*0.3,
            width: width,
            color: AppColor.primaryColor.withOpacity(0.6),

          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.04,),
                CircleAvatar(
                  radius: width*0.155,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: width*0.15,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
                SizedBox(height: height*0.01,),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),

                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
