import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';

import '../../component/Network Image/network_image.dart';
import '../../functions/fucntions.dart';
import '../Show Rate/show_rate.dart';

class DoctorWidget extends StatelessWidget {
  final String image;
  final String name;
  final String position;
  final String avgRate;
  final String totalReview;
  final String price;
  final String discountValue;
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
    required this.price,
    required this.discountValue,
  });

  @override
  Widget build(BuildContext context) {



    return SizedBox(
      width: width,
      height: height * 0.2,
      child: Card(
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
                  padding: EdgeInsets.only(
                    left:  context.read<GlobalCubit>().local=='en'?width*0.03:0,
                    right: context.read<GlobalCubit>().local=='en'?0:width*0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(hasDiscount(discountValue))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(

                            padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: 2),
                            margin: EdgeInsets.only(bottom: height*0.005),
                            child: Text(
                              '${calculateDiscountPercentage(price, discountValue)}%',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],

                      ),
                      Expanded(
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

                            SizedBox(
                              height: height * 0.005,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${int.parse(price) - int.parse(discountValue)}',
                                  style: Theme.of(context).textTheme.titleLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                if(hasDiscount(discountValue))
                                SizedBox(width: 5,),
                                if(hasDiscount(discountValue))
                                Text(
                                  price,
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),

                                ),

                                SizedBox(width: 5,),

                                Text(
                                  'EGP',
                                  style: Theme.of(context).textTheme.titleMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),

                            SizedBox(
                              height: height * 0.005,
                            ),
                        //    Spacer(),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}