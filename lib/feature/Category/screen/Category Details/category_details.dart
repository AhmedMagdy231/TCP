import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';

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
  int pageNumber = 1;

  @override
  void initState() {
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
    print(pageKey);
    try {
      final newItems = await DioHelper.postData(
        data: {
          'type' : 'specialty',
          'id' : widget.id,
           'page' : pageNumber,
        },

        url: EndPoints.category_request,
      );

      final CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel.fromJson(newItems.data);

      if (!categoryDetailsModel.hasError) {
        final isLastPage =
            categoryDetailsModel.data!.pageCurrent ==  categoryDetailsModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(categoryDetailsModel.data!.partners);
        } else {
          final nextPageKey = pageKey +categoryDetailsModel.data!.partners.length;
          pageNumber++;
          _pagingController.appendPage(
              categoryDetailsModel.data!.partners, nextPageKey);
        }
      } else {}
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }





  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: height,
        child: PagedListView<int, Partners>(
          pagingController: _pagingController,
          physics: const BouncingScrollPhysics(),
          builderDelegate:
          PagedChildBuilderDelegate<Partners>(
            itemBuilder: (context, item, index) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.015,
                  vertical: height * 0.005),
              child: SizedBox(
                width: width,
                height: height * 0.18,
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
                    image:  item.partnerPic!,
                    name: item.partnerFullname!,
                    position:  item.partnerPosition!,
                    avgRate: item.partnerReviewsAvg!,
                    totalReview: item.partnerReviewsTotal!,
                    width: width,
                    height: height,
                  ),
                ),
              ),
            ),
            transitionDuration: const Duration(milliseconds: 900),
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
              return  Container(height: height*0.1,child: Center(child: CircularProgressIndicator(),),);
            },

            noItemsFoundIndicatorBuilder: (context){
              return  BuildEmptyDataWidget(text: 'No doctor found in this Speciality',);
            }

          ),
        ),
      ),
    );
  }
}


