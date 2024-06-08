import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/utils/utils.dart';
import 'package:tricare_patient_application/feature/Bookmark/cubit/book_mark_cubit.dart';

import '../../../feature/Category/model/category_details_model.dart';
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
  final bool favourite;
  final PagingController<int, Partners>? pagingController;
  final String doctorId;
  final int index;
  final Partners item;

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
    required this.favourite,
    required this.index,
    required this.doctorId,
    required this.item,
     this.pagingController,
  });

  @override
  Widget build(BuildContext context) {

   bool currentFavourite = favourite;

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

                      Row(

                        children: [

                          if(hasDiscount(discountValue))
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
                          Spacer(),

                          StatefulBuilder(
                            builder: (context,setState){
                              return IconButton(
                                  onPressed: () async {
                                    if(currentFavourite){

                                      setState((){
                                        currentFavourite  = !currentFavourite;
                                      });


                                      pagingController!.itemList!.removeAt(index);
                                      context.read<BookMarkCubit>().refreshPage();
                                      context.read<BookMarkCubit>().changeBookmark(
                                          id: doctorId,
                                          action: 'remove'
                                      );


                                    }
                                    else
                                    {

                                      Utils.showLoadingDialog(context);
                                      await  context.read<BookMarkCubit>().changeBookmark(
                                          id: doctorId,
                                          action: 'add'
                                      );
                                      Navigator.pop(context);
                                      setState((){
                                        currentFavourite  = !currentFavourite;
                                      });

                                     item.bookmark = currentFavourite;

                                    }
                                  },
                                  icon: currentFavourite?
                                  Icon(Icons.favorite,color: Colors.red,size: 30,):
                                  Icon(Icons.favorite_border,size: 30,)
                              );
                            },
                          ),
                        ],

                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
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

                                if(hasDiscount(discountValue))
                                  Text(
                                    '${price} EGP',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),

                                  ),

                                SizedBox(width: 5,),

                                Text(
                                  '${int.parse(price) - int.parse(discountValue)} EGP',
                                  style: Theme.of(context).textTheme.titleLarge,
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