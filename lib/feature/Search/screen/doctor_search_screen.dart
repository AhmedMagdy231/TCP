import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/component/TextField/text_form_field.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Search/cubit/search_cubit.dart';

import '../../../core/functions/fucntions.dart';
import '../../../core/widgets/Doctor Widget/doctor_widget.dart';
import '../../../core/widgets/Not Found In Search/not_found_in_search.dart';
import '../../Category/screen/Category Details/widget/loading_shimmer.dart';
import '../../Doctor/cubit/doctor_cubit.dart';
import '../../Doctor/screens/Doctor Details/doctor_details_screen.dart';

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {

  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.015),
        child: Column(
          children: [
            BuildTextFormField(
              controller: TextEditingController(),
              hintText: 'Search at doctor...',
              prefixIcon: Icon(Icons.search),
              contendPadding: EdgeInsets.symmetric(
                  vertical: height*0.0,
                  horizontal: width*0.06 ,
              ),
              onchange: (value) {
                context
                    .read<SearchCubit>()
                    .getDoctorSearch(query: value.trim(), id: '0');
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                switch (state.doctorSearchStatus) {
                  case Status.initial || Status.loading:
                    return Expanded(child: ListView.builder(itemBuilder: (context,index)=> LoadingSimmerWidget(), itemCount: 5,));
                  case Status.success:
                    var cubit = context.read<SearchCubit>();
                    return cubit.searchDoctorModel!.hasError ? Expanded(
                            child: const NoItemInSearch(
                              text: 'Not Found Any Doctor with this name',
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: cubit
                                  .searchDoctorModel!.data!.partners!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.0,
                                      vertical: height * 0.005),
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.15,
                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<DoctorCubit>()
                                            .getDoctorDetails(
                                          id: cubit.searchDoctorModel!.data!
                                              .partners![index].pARTNERID,
                                        );

                                        navigateTo(
                                            context,
                                            DoctorDetailsScreen(
                                              id: cubit.searchDoctorModel!.data!
                                                  .partners![index].pARTNERID!,
                                            ));
                                      },
                                      child: DoctorWidget(
                                        image: cubit.searchDoctorModel!.data!
                                            .partners![index].partnerPic!,
                                        name: cubit.searchDoctorModel!.data!
                                            .partners![index].partnerName!,
                                        position: cubit.searchDoctorModel!.data!
                                            .partners![index].partnerPosition!,
                                        avgRate: cubit
                                            .searchDoctorModel!
                                            .data!
                                            .partners![index]
                                            .partnerReviewsAvg!,
                                        totalReview: cubit
                                            .searchDoctorModel!
                                            .data!
                                            .partners![index]
                                            .partnerReviewsTotal!,
                                        width: width,
                                        height: height,
                                      ),
                                    ),
                                  )
                                      .animate()
                                      .fadeIn(duration: 100.ms)
                                      .then(delay: 0.ms)
                                      .fade(),
                                );
                              },
                            ),
                          );
                  case Status.noInternet:
                    return Expanded(
                      child: NoInternetWidget(
                        onPressed: () {},
                      ),
                    );
                  case Status.failure:
                    return BuildErrorWidget(error: state.callback);
                }
                return Text('d');
              },
            ),
          ],
        ),
      ),
    );
  }
}
