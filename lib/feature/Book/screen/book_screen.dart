import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/light_app_color.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/widgets/Build%20Circle%20Image/build_circle_image.dart';
import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Book/screen/widget/book_card_widget.dart';
import 'package:tricare_patient_application/feature/Book/screen/widget/loading_widget.dart';
import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';
import 'package:tricare_patient_application/feature/Sessions/model/session_model.dart';

import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';

class BookScreen extends StatefulWidget {
  final bool comeFromHomeLayout;

  const BookScreen({Key? key, this.comeFromHomeLayout = true}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

// with AutomaticKeepAliveClientMixin<BookScreen>

class _BookScreenState extends State<BookScreen> {
  final PagingController<int, Sessions> _pagingController = PagingController(firstPageKey: 0);
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

  //@override
  //bool get wantKeepAlive => true; // to keep the state alive

  Future<void> _fetchPage(int pageKey) async {




    await Future.delayed(Duration(seconds: 1));
    print(pageKey);
    try {
      final newItems = await DioHelper.postData(
          data: {
            'page': pageNumber,
          },
          url: EndPoints.session_request,
          token: CashHelper.prefs.getString('token') ?? "");
      final SessionModel sessionModel = SessionModel.fromJson(newItems.data);
      if (!sessionModel.hasError!) {
        final isLastPage =
            sessionModel.data!.pageCurrent == sessionModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(sessionModel.data!.sessions!);
        } else {
          final nextPageKey = pageKey + sessionModel.data!.sessions!.length;
          pageNumber++;
          _pagingController.appendPage(
              sessionModel.data!.sessions!, nextPageKey);
        }
      } else {
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
   // super.build(context); // call super method
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: !widget.comeFromHomeLayout
          ? AppBar(
        title: Text('Booking'),
      )
          : null,
      body: CashHelper.getData(key: 'login') == null
          ? BuildEmptyDataWidget(
        text: 'You do not have any book appointment',
      )
          : PagedListView<int, Sessions>(
        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate:
        PagedChildBuilderDelegate<Sessions>(
          itemBuilder: (context, item, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.009),
            child:  BookCardWidget(
              index: index,
              doctorId: item.pARTNERID!,
              status: item.status!,
              day: getDayName(item.sessionDate!, locale: CashHelper.getData(key: 'local') ?? 'en'),
              date: item.sessionDate!,
              time: convertTo12HourFormat(item.sessionStart!),
              name: item.partnerName!,
              image: item.partnerPic!,
              position: item.partnerPosition!,
              doctorRate: item.partnerReviewsAvg!,
            ),
          ),
          transitionDuration: const Duration(milliseconds: 900),
          animateTransitions: true,
          firstPageProgressIndicatorBuilder: (context) {
            return Column(
              children: [
                BuildShimmerLoadingWidget(),
                BuildShimmerLoadingWidget(),
                BuildShimmerLoadingWidget(),
                BuildShimmerLoadingWidget(),
                BuildShimmerLoadingWidget(),
              ],
            );
          },
          newPageProgressIndicatorBuilder: (context) {
            return  Container(height: height*0.1,child: Center(child: CircularProgressIndicator(),),);
          },
            noItemsFoundIndicatorBuilder: (context){
              return  BuildEmptyDataWidget(text: 'You do not have any book appointment yet',);
            }
        ),
      ),
    );
  }
}
