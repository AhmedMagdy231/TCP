import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricare_patient_application/feature/Bookmark/cubit/book_mark_cubit.dart';

import '../../../core/functions/fucntions.dart';
import '../../../core/network/Local/CashHelper.dart';
import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../../../core/widgets/Doctor Widget/doctor_widget.dart';
import '../../../core/widgets/Empty Data Widget/empty_data_widget.dart';
import '../../../generated/l10n.dart';
import '../../Category/model/category_details_model.dart';
import '../../Category/screen/Category Details/widget/loading_shimmer.dart';
import '../../Doctor/cubit/doctor_cubit.dart';
import '../../Doctor/screens/Doctor Details/doctor_details_screen.dart';
import '../model/bookmark_model.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {

  final PagingController<int,Partners> _pagingController = PagingController(firstPageKey: 0);
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

    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {

    await Future.delayed(Duration(seconds: 1));


    try {
      final response = await DioHelper.postData(
          data: {
            'page': pageNumber,
          },
          url: EndPoints.doctor_bookmark_request,
          token: CashHelper.prefs.getString('token') ?? "");

      final BookmarkModel bookmarkModel = BookmarkModel.fromJson(response.data);
      if (!bookmarkModel.hasError!) {
        final isLastPage =
            bookmarkModel.data!.pageCurrent == bookmarkModel.data!.pageMax;
        if (isLastPage) {

          _pagingController.appendLastPage(bookmarkModel.data!.partnersBookmarks);
        } else {
          final nextPageKey = pageKey + bookmarkModel.data!.partnersBookmarks.length;
          pageNumber++;
          _pagingController.appendPage(
              bookmarkModel.data!.partnersBookmarks, nextPageKey
          );
        }
      } else
      {
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favourite),
      ),
      body: BlocBuilder<BookMarkCubit, BookMarkState>(
  builder: (context, state) {
    return Container(
        height: height,
        child: PagedListView<int, Partners>(
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
                    comeFrom: ComeFrom.Bookmark,
                    item: item,
                    pagingController: _pagingController,
                    index: index,
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
                  text: S.of(context).emptyFavourite,
                );
              }),
        ),
      );
  },
),

    );
  }
}
