import 'package:flutter/material.dart';

import '../../../../../core/component/SVG/svg.dart';
import '../../../../../core/functions/fucntions.dart';
import '../../../../../core/globle/color/shared_color.dart';



class DateTimeWidget extends StatelessWidget {

 final double width;
 final double height;
 final String date;
 final String time;

  const DateTimeWidget({super.key, required this.width, required this.height, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.03),
          child: BuildIconSvg(name: 'date.svg',color: AppColor.primaryColor,),
        ),
        SizedBox(

          child: VerticalDivider(thickness: 2,color: AppColor.primaryColor.withOpacity(0.5),),
          height: height*0.06,

        ),
        SizedBox(width: width*0.03,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              '${getDayName(date)} - ${formatDate(date)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            Text(
              time,
              style: Theme.of(context).textTheme.titleMedium,
            ),

          ],
        ),
      ],
    );
  }
}
