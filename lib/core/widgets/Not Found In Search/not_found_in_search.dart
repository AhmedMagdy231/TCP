import 'package:flutter/material.dart';
import 'package:tricare_patient_application/core/component/SVG/svg.dart';

import '../../globle/color/shared_color.dart';

class NoItemInSearch extends StatelessWidget {
  final String text;
  const NoItemInSearch({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off,size: 80,color: AppColor.primaryColor,),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}


class SearchAtDoctorWidget extends StatelessWidget {
  final String text;
  const SearchAtDoctorWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildIconSvg(name: 'search.svg',size: 80,color: Colors.black,),
          SizedBox(height: 10,),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
