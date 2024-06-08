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

enum ComeFrom  {Search,Bookmark,CategoryDetails}

class DoctorWidget extends StatelessWidget {

  final double height;
  final double width;
  final PagingController<int, Partners>? pagingController;
  final int index;
  final Partners item;
  final ComeFrom comeFrom;


  const DoctorWidget({
    super.key,
    required this.width,
    required this.height,
    required this.comeFrom,
    required this.index,
    required this.item,
     this.pagingController,
  });

  @override
  Widget build(BuildContext context) {


   bool currentFavourite = item.bookmark;

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
                    image: item.partnerPic!,
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

                          if(hasDiscount(item.partnerSessionDiscount!))
                          Container(

                            padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: 2),
                            margin: EdgeInsets.only(bottom: height*0.005),
                            child: Text(
                              '${calculateDiscountPercentage(item.partnerSessionPrice!, item.partnerSessionDiscount!)}%',
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


                                      Utils.showLoadingDialog(context);
                                    await  context.read<BookMarkCubit>().changeBookmark(
                                          id: item.partnerid!,
                                          action: 'remove'
                                      );
                                      Navigator.pop(context);

                                      setState((){
                                        currentFavourite  = !currentFavourite;
                                      });
                                      item.bookmark = currentFavourite;

                                      if(comeFrom == ComeFrom.Bookmark){
                                        pagingController!.itemList!.removeAt(index);
                                      }


                                    }
                                    else
                                    {

                                      Utils.showLoadingDialog(context);
                                      await  context.read<BookMarkCubit>().changeBookmark(
                                          id: item.partnerid!,
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
                              item.partnerName!,
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

                                if(hasDiscount(item.partnerSessionDiscount!))
                                  Text(
                                    '${item.partnerSessionPrice!} EGP',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),

                                  ),

                                SizedBox(width: 5,),

                                Text(
                                  '${int.parse(item.partnerSessionPrice!) - int.parse(item.partnerSessionDiscount!)} EGP',
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
                                  rate: item.partnerReviewsAvg!,
                                ),
                                const Spacer(),
                                Text(
                                  '${item.partnerReviewsAvg!} (${item.partnerReviewsTotal} review)',
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