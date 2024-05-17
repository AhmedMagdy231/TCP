import 'package:flutter/material.dart';

import '../../../../../core/component/SVG/svg.dart';
import '../../../../../core/globle/color/shared_color.dart';

class AboutDoctorWidget extends StatelessWidget {
  final String numberOfPatient;
  final String experience;
  final String rate;
  final String review;

  const AboutDoctorWidget({super.key, required this.numberOfPatient, required this.experience, required this.rate, required this.review});
  


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BuildItem(height: height, iconName: 'users.svg', number: formatNumber(int.parse(numberOfPatient)), text: 'Patient',),
        
        BuildItem(height: height, iconName: 'exp.svg', number: '$experience Years', text: 'Experience',),
        
        BuildItem(height: height, iconName: 'star.svg', number: rate, text: 'Rating',),
        
        BuildItem(height: height, iconName: 'review.svg', number: formatNumber(int.parse(review)), text: 'Review',),
      ],
    );
  }
}

class BuildItem extends StatelessWidget {
  final double height;
  final String iconName;
  final String number;
  final String text;

  const BuildItem(
      {super.key,
      required this.height,
      required this.iconName,
      required this.number,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColor.primaryColor.withOpacity(0.3),
          child: BuildIconSvg(
            name: iconName,
            color: AppColor.primaryColor,
            size: 30,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Text(
          number,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColor.primaryColor,
              ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

String formatNumber(int number) {
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    double num = number / 1000;
    return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}k';
  } else if (number < 1000000000) {
    double num = number / 1000000;
    return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}M';
  } else {
    double num = number / 1000000000;
    return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}B';
  }
}
