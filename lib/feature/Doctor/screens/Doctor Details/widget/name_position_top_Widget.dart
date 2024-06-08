import 'package:flutter/material.dart';

import '../../../../../core/widgets/Show Rate/show_rate.dart';


class NamePositionTopWidget extends StatelessWidget {
  final String name;
  final String position;
  final String rate;

  const NamePositionTopWidget({super.key, required this.name, required this.position,required this.rate});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
          ),

          Text(
            '${position}',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
          ),

          const SizedBox(height: 5,),

           ShowRateStar(
            iconSize: 15,
            rate: rate,
          ),
        ],
      ),
    );
  }
}
