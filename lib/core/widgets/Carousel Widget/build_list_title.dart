
import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../component/SVG/svg.dart';
import '../../globle/color/dark_app_color.dart';



class BuildListTitle extends StatelessWidget {

  final String text;
  final  String iconName;
  void Function()? function;
  double? size;
  Color? color;
  Color? textColor;



   BuildListTitle({required this.text,required this.iconName,required this.function,this.size,this.color,this.textColor}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        tileColor: Colors.white,
        onTap: function,
        title: Text(
            text,
           style: Theme.of(context).textTheme.titleMedium!.copyWith(
             color: textColor,
           ),
        ),
        trailing:   Icon(Icons.arrow_forward_ios,color: color?? AppColor.primaryColor,),
        leading: CircleAvatar(
          backgroundColor: AppColor.primaryColor.withOpacity(0.2),
            child: BuildIconSvg(
              name: iconName,
              size: size??20,
              color: color?? AppColor.primaryColor,
            ),
        ),
      ),
    );
  }
}
