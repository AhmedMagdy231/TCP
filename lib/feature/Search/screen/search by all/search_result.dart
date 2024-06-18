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
import 'package:tricare_patient_application/feature/Doctor/model/doctor_details_model.dart';
import 'package:tricare_patient_application/feature/Search/model/doctor_search_model.dart';

import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../../../core/widgets/Doctor Widget/doctor_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../Category/screen/Category Details/widget/loading_shimmer.dart';
import '../../../Doctor/cubit/doctor_cubit.dart';
import '../../../Doctor/screens/Doctor Details/doctor_details_screen.dart';


class SearchResultScreen extends StatefulWidget {

  final PagingController<int ,Partners> pagingController;
  final ScrollController scrollController;

  const SearchResultScreen({super.key, required this.pagingController, required this.scrollController});


  @override
  State<SearchResultScreen> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResultScreen> {



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PagedListView<int, Partners>(
      scrollController: widget.scrollController,
      pagingController: widget.pagingController,

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
                comeFrom: ComeFrom.CategoryDetails,
                index: index,
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
              text: S.of(context).noDoctorFoundByThisSearch,
            );
          }),
    );
  }
}


