import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
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
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/doctor_details_screen.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';
import 'package:tricare_patient_application/feature/Sessions/model/session_model.dart';

import '../../../core/network/Remote/DioHelper.dart';
import '../../../core/network/endPoind.dart';
import '../../../generated/l10n.dart';
import '../../Authentication/screens/Login/login_screen.dart';

class BookScreen extends StatefulWidget {
  final bool comeFromHomeLayout;

  const BookScreen({Key? key, this.comeFromHomeLayout = true})
      : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

// with AutomaticKeepAliveClientMixin<BookScreen>

class _BookScreenState extends State<BookScreen> {
  final PagingController<int, Sessions> _pagingController =
      PagingController(firstPageKey: 0);
  int pageNumber = 1;
 late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //@override
  //bool get wantKeepAlive => true; // to keep the state alive

  Future<void> _fetchPage(int pageKey) async {
    await Future.delayed(Duration(seconds: 1));

    try {
      final newItems = await DioHelper.postData(
          data: {
            'page': pageNumber,
            'section': sectionApi,
          },
          url: EndPoints.session_request,
          token: CashHelper.prefs.getString('token') ?? "");

      final SessionModel sessionModel = SessionModel.fromJson(newItems.data);
      if (!sessionModel.hasError!) {
        final isLastPage =
            sessionModel.data!.pageCurrent == sessionModel.data!.pageMax;
        if (isLastPage) {
          _pagingController.appendLastPage(sessionModel.data!.sessions);
        } else {
          final nextPageKey = pageKey + sessionModel.data!.sessions.length;
          pageNumber++;
          _pagingController.appendPage(
              sessionModel.data!.sessions, nextPageKey);
        }
      } else {
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }

  int section = 1;
  String sectionApi = 'today';

  @override
  Widget build(BuildContext context) {
    // super.build(context); // call super method
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: !widget.comeFromHomeLayout
              ? AppBar(
                  title: Text(S.of(context).booking),
                )
              : null,
          body: CashHelper.getData(key: 'login') == null
              ? buildUnLoginWidget(width, height, context)
              : Column(
                  children: [

                   SizedBox(
                     height: height*0.05,
                     child: ListView(
                       scrollDirection: Axis.horizontal,
                       children: [
                         BuildSectionContainer(
                           height: height,
                           width: width,
                           number: 1,
                           section: section,
                           text: S.of(context).today,
                           onTap: (){
                             setState(() {
                               section = 1;
                             });

                             sectionApi = 'today';
                             _pagingController.itemList=[];
                             _pagingController.refresh();
                             _scrollController.animateTo(
                               0.0,
                               duration: Duration(milliseconds: 500),
                               curve: Curves.easeInOut,
                             );


                           },

                         ),

                         BuildSectionContainer(
                           height: height,
                           width: width,
                           number: 2,
                           section: section,
                           text: S.of(context).upcoming,
                           onTap: (){
                             setState(() {
                               section = 2;
                             });

                             sectionApi = 'upcoming';
                             _pagingController.itemList=[];
                             _pagingController.refresh();
                             _scrollController.animateTo(
                               0.0,
                               duration: Duration(milliseconds: 500),
                               curve: Curves.easeInOut,
                             );

                           },

                         ),

                         BuildSectionContainer(
                           height: height,
                           width: width,
                           number: 3,
                           section: section,
                           text: S.of(context).past,
                           onTap: (){
                             setState(() {
                               section = 3;
                             });
                             sectionApi = 'past';
                             _pagingController.itemList=[];
                             _pagingController.refresh();
                             _scrollController.animateTo(
                               0.0,
                               duration: Duration(milliseconds: 500),
                               curve: Curves.easeInOut,
                             );
                           },

                         ),

                         BuildSectionContainer(
                           height: height,
                           width: width,
                           number: 4,
                           section: section,
                           text: S.of(context).all,
                           onTap: (){
                             setState(() {
                               section = 4;
                             });
                             sectionApi = 'all';
                             _pagingController.itemList=[];
                             _pagingController.refresh();
                             _scrollController.animateTo(
                               0.0,
                               duration: Duration(milliseconds: 500),
                               curve: Curves.easeInOut,
                             );
                           },

                         ),
                       ],
                     ),
                   ),
                    SizedBox(height: height*0.01,),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _pagingController.refresh();
                          pageNumber = 1;
                        },
                        child: PagedListView<int, Sessions>(
                          pagingController: _pagingController,
                          scrollController: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          builderDelegate: PagedChildBuilderDelegate<Sessions>(
                              itemBuilder: (context, item, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.003),
                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<DoctorCubit>()
                                            .getDoctorDetails(
                                                id: item.partnerid!);
                                        navigateTo(
                                            context,
                                            DoctorDetailsScreen(
                                                id: item.partnerid!));
                                      },
                                      child: BookCardWidget(
                                        index: index,
                                        doctorId: item.partnerid!,
                                        status: item.status!,
                                        day: getDayName(
                                          item.sessionDate!,
                                        ),
                                        date: item.sessionDate!,
                                        time: item.sessionStartDisplay!,
                                        name: item.partnerName!,
                                        image: item.partnerPic!,
                                        position: item.partnerPosition!,
                                        doctorRate: item.partnerReviewsAvg!,
                                        sessionId: item.sessionid!,
                                        speciality: item.specialtyid!,
                                        sessions: item,
                                      ),
                                    ),
                                  ),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
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
                                return Container(
                                  height: height * 0.1,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              noItemsFoundIndicatorBuilder: (context) {
                                return BuildEmptyDataWidget(
                                  text: S
                                      .of(context)
                                      .youDoNotHaveAnyBookAppointmentYet,
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Padding buildUnLoginWidget(
      double width, double height, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.5,
            child: Image.asset('assets/images/login.png'),
          ),
          Text(
            S.of(context).youMustBeLoggedInToViewYourCurrentSessions,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width,
            child: ElevatedButton(
              onPressed: () {
                navigateTo(context, LoginScreen());
              },
              child: Text(S.of(context).login),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSectionContainer extends StatelessWidget {
  final double height;
  final double width;
  final int number;
  final int section;
  final String text;
  void Function()? onTap;


   BuildSectionContainer({
    super.key,
    required this.height,
    required this.width,
    required this.number,
    required this.section,
    required this.text,
     required this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width*0.01),
        alignment: Alignment.center,
        height: height * .05,
        width: width * 0.3,
        decoration: BoxDecoration(
          color: number == section? AppColor.primaryColor: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
           text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: number == section? Colors.white: Colors.black,
              ),
        ),
      ),
    );
  }
}
