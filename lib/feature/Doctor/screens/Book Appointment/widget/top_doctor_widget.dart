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
  final String speciality;

  const TopDoctorWidget({super.key,required this.speciality ,required this.width, required this.height, required this.name, required this.rate, required this.position, required this.image});


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
              padding:  EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.0001),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    '${name}',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        speciality,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        position,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),

                 // SizedBox(height: 5,),

                  ShowRateStar(
                    rate: rate,
                    iconSize: 15,
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
