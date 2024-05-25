import 'package:flutter/material.dart';

import '../../component/Network Image/network_image.dart';
import '../Show Rate/show_rate.dart';

class DoctorWidget extends StatelessWidget {
  final String image;
  final String name;
  final String position;
  final String avgRate;
  final String totalReview;
  final double height;
  final double width;

  const DoctorWidget({
    super.key,
    required this.image,
    required this.name,
    required this.position,
    required this.avgRate,
    required this.totalReview,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              child: AspectRatio(
                aspectRatio: 1/1,
                child: BuildImage(
                  image: image,
                  radius: 8,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dr. ${name}',
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      position,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      children: [
                        ShowRateStar(
                          rate: avgRate,
                        ),
                        const Spacer(),
                        Text(
                          '${avgRate} (${totalReview} review)',
                          style:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}