import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';

import 'package:tricare_patient_application/feature/Category/model/category_details_model.dart';

import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../../../core/widgets/Doctor Widget/doctor_widget.dart';
import '../../../Doctor/cubit/doctor_cubit.dart';
import '../../../Doctor/screens/Doctor Details/doctor_details_screen.dart';
import 'widget/loading_shimmer.dart';

class CategoryDetails extends StatefulWidget {
  final String title;
  final String id;

  const CategoryDetails({super.key, required this.title, required this.id});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final PagingController<int, Partners> _pagingController = PagingController(firstPageKey: 0);

  late ScrollController _scrollController;


  @override
  void initState() {
    _scrollController = ScrollController();
    context.read<CategoryCubit>().pageNumber=1;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchPage(int pageKey) async {
    await Future.delayed(Duration(seconds: 1));

    try {
      final response = await DioHelper.postData(
        data: {
          'type': 'specialty',
          'id': widget.id,
          'page': context.read<CategoryCubit>().pageNumber,
          'sortBy': context.read<CategoryCubit>().sortByApi,
        },
        url: EndPoints.category_request,
       token: CashHelper.getData(key: 'token'),
      );


      final CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel.fromJson(response.data);

      if (!categoryDetailsModel.hasError) {
        final isLastPage = categoryDetailsModel.data!.pageCurrent ==
            categoryDetailsModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(categoryDetailsModel.data!.partners);
        } else {
          final nextPageKey =
              pageKey + categoryDetailsModel.data!.partners.length;
          context.read<CategoryCubit>().pageNumber++;
          _pagingController.appendPage(
              categoryDetailsModel.data!.partners, nextPageKey);
        }
      } else {}
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                builder: (BuildContext context) {
                  return BottomSheetWidget(pagingController: _pagingController,scrollController: _scrollController,);
                },
              );
            },
            child: Row(
              children: [
                Icon(Icons.sort),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Sort By',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        height: height,
        child: PagedListView<int, Partners>(
          scrollController: _scrollController,
          pagingController: _pagingController,
          physics: const BouncingScrollPhysics(),
          builderDelegate: PagedChildBuilderDelegate<Partners>(
              itemBuilder: (context, item, index) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.015, vertical: height * 0.003),
                    child: GestureDetector(
                      onTap: () {
                        context.read<DoctorCubit>().getDoctorDetails(
                              id: item.partnerid,
                            );

                        navigateTo(
                            context,
                            DoctorDetailsScreen(
                              id: item.partnerid!,
                            ));
                      },
                      child: DoctorWidget(
                        index: index,
                        image: item.partnerPic!,
                        name: item.partnerName!,
                        position: item.partnerPosition!,
                        avgRate: item.partnerReviewsAvg!,
                        totalReview: item.partnerReviewsTotal!,
                        price: item.partnerSessionPrice!,
                        discountValue: item.partnerSessionDiscount!,
                        favourite: item.bookmark,
                        doctorId: item.partnerid!,
                        item: item,
                        width: width,
                        height: height,
                      ),
                    ),
                  ),
              transitionDuration: const Duration(milliseconds: 500),
              animateTransitions: true,
              firstPageProgressIndicatorBuilder: (context) {
                return Column(
                  children: [
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                    LoadingSimmerWidget(),
                  ],
                );
              },
              newPageProgressIndicatorBuilder: (context) {
                return Container(
                  height: height * 0.1,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              noItemsFoundIndicatorBuilder: (context) {
                return BuildEmptyDataWidget(
                  text: 'No doctor found in this Speciality',
                );
              }),
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  final PagingController<int, Partners> pagingController;
  final  ScrollController scrollController;
  const BottomSheetWidget({super.key,required this.pagingController,required this.scrollController});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = context.read<CategoryCubit>();
    return SizedBox(

      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Sort By',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);


                  },
                  child: Container(
                    child: Icon(Icons.close),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),

            RadioListTileWidget(
              currentValue: cubit.sortBy,
              value: 1,
              text:'Price Low',
              onChanged: (value) {
                setState(() {
                  cubit.sortBy = value!;
                  cubit.sortByApi ='price_low';
                  context.read<CategoryCubit>().pageNumber =1;
                  widget.pagingController.itemList=[];
                  widget.pagingController.refresh();
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);

                });
              },

            ),

            RadioListTileWidget(
              currentValue: cubit.sortBy,
              value: 2,
              text:'Price High',
              onChanged: (value) {
                setState(() {
                  cubit.sortBy = value!;
                  cubit.sortByApi ='price_high';
                  context.read<CategoryCubit>().pageNumber =1;
                  widget.pagingController.itemList=[];
                  widget.pagingController.refresh();
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);

                });
              },

            ),

            RadioListTileWidget(
              currentValue: cubit.sortBy,
              value: 3,
              text: 'Newest',
              onChanged: (value) {
                setState(() {
                  cubit.sortBy = value!;
                  cubit.sortByApi ='newest';
                  context.read<CategoryCubit>().pageNumber =1;
                  widget.pagingController.itemList=[];
                  widget.pagingController.refresh();
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                });
              },

            ),

            RadioListTileWidget(
              currentValue: cubit.sortBy,
              value: 4,
              text: 'Oldest',
              onChanged: (value) {
                setState(() {
                  cubit.sortBy = value!;
                  cubit.sortByApi ='oldest';
                  context.read<CategoryCubit>().pageNumber =1;
                  widget.pagingController.itemList=[];
                  widget.pagingController.refresh();
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                });
              },

            ),

            RadioListTileWidget(
              currentValue: cubit.sortBy,
              value: 5,
              text: 'Alphabetic',
              onChanged: (value) {
                setState(() {
                  cubit.sortBy = value!;
                  cubit.sortByApi ='alphabetic';
                  context.read<CategoryCubit>().pageNumber =1;
                  widget.pagingController.itemList=[];
                  widget.pagingController.refresh();
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                });
              },

            ),

            RadioListTileWidget(
              currentValue: cubit.sortBy,
              value: 6,
              text: 'Rating',
              onChanged: (value) {
                setState(() {
                  cubit.sortBy = value!;
                  cubit.sortByApi ='reviews';
                  context.read<CategoryCubit>().pageNumber =1;
                  widget.pagingController.itemList=[];
                  widget.pagingController.refresh();
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                });
              },

            ),
          ],
        ),
      ),
    );
  }
}

class RadioListTileWidget extends StatelessWidget {
  final int value;
  final currentValue;
  final String text;
  final void Function(dynamic)? onChanged;

  const RadioListTileWidget(
      {super.key,
      required this.currentValue,
      required this.value,
      required this.text,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: currentValue,
      onChanged: onChanged,
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: currentValue == value ? Colors.black : Colors.black54,
            ),
      ),
    );
  }
}
