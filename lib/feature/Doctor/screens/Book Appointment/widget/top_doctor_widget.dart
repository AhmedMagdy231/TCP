import 'package:flutter/material.dart';

import '../../../../../core/component/Network Image/network_image.dart';
import '../../../../../core/widgets/Show Rate/show_rate.dart';

class TopDoctorWidget extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final String rate;
  final String position;
  final String image;

  const TopDoctorWidget({super.key, required this.width, required this.height, required this.name, required this.rate, required this.position, required this.image});


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: width*0.3,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.3,
            height: width * 0.3,
            child: BuildImage(
              image: image,
              radius: 12,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    'Dr. ${name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Expanded(
                    child: Text(
                      position,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  SizedBox(height: 5,),

                  Expanded(child:  ShowRateStar(
                    rate: rate,
                    iconSize: 15,
                  ),)


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
