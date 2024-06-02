import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool seeAll;

  const TitleWidget({super.key, required this.title, this.onTap, this.seeAll = true});



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.02),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
        seeAll?
        InkWell(
            onTap: onTap,
            child: Text(
              S.of(context).seeAll,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
              ),


            ),

          ) :
        SizedBox(),
        ],
      ),
    );
  }
}
