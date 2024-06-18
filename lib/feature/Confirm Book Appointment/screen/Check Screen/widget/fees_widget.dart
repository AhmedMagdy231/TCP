import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/SVG/svg.dart';

import '../../../../../core/functions/fucntions.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../../../generated/l10n.dart';



class FeesWidget extends StatelessWidget {

  final double width;
  final double height;
  final String price;
  final String priceAfterDiscount;


  const FeesWidget({
    super.key, required this.width,
    required this.height,
    required this.priceAfterDiscount,
  required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.03),
          child: BuildIconSvg(name: 'money.svg',color: AppColor.primaryColor,),
        ),
        SizedBox(

          child: VerticalDivider(thickness: 2,color: AppColor.primaryColor.withOpacity(0.5),),
          height: height*0.04,

        ),
        SizedBox(width: width*0.03,),
        Text(
          S.of(context).fees,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Spacer(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.03),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${int.parse(price) - int.parse(priceAfterDiscount)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(width: 5,),
              Text(
                S.of(context).egp,
                style: Theme.of(context).textTheme.titleMedium,
              ),


            ],
          ),
        ),

      ],
    );
  }
}
