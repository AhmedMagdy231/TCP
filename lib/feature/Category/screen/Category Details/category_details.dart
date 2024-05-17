import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate/rate.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/widgets/Empty%20Data%20Widget/empty_data_widget.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/Show%20Rate/show_rate.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/screens/Doctor%20Details/doctor_details_screen.dart';

import '../../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import 'widget/loading_shimmer.dart';

class CategoryDetails extends StatelessWidget {
  final String title;
  final String id;

  const CategoryDetails({super.key,required this.title,required this.id});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var cubit = context.read<CategoryCubit>();
          switch(state.categoryDetailsStatus){
            case Status.initial:
            case Status.loading:
              return const LoadingSimmerWidget();
            case Status.success:
              return   cubit.categoryDetailsModel!.hasError? BuildErrorWidget(error: cubit.categoryDetailsModel!.errors.join(' ')):
              cubit.categoryDetailsModel!.data!.partners!.isEmpty? BuildEmptyDataWidget():
              ListView.builder(
                itemCount: cubit.categoryDetailsModel!.data!.partners!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.015,vertical: height*0.005),
                    child: SizedBox(
                      width: width,
                      height: height * 0.15,
                      child: GestureDetector(
                          onTap: (){
                            context.read<DoctorCubit>().getDoctorDetails(
                                id: cubit.categoryDetailsModel!.data!.partners![index].pARTNERID,
                            );

                            navigateTo(context,  DoctorDetailsScreen(
                              id: cubit.categoryDetailsModel!.data!.partners![index].pARTNERID!,
                            ));
                          },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: BuildImage(
                                    image: cubit.categoryDetailsModel!.data!
                                        .partners![index].partnerPic!,
                                    radius: 8,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                        
                                        Text(
                                          'Dr. ${cubit.categoryDetailsModel!.data!
                                              .partners![index].partnerFullname}',
                                          style: Theme.of(context).textTheme.titleMedium,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                        
                                        Text(
                                          cubit.categoryDetailsModel!.data!
                                              .partners![index].partnerPosition!,
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            color: Colors.grey,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                        
                                        SizedBox(height: height*0.015,),
                        
                                        Row(
                                          children: [
                                            ShowRateStar(
                                                rate:  cubit.categoryDetailsModel!.data!
                                                    .partners![index].partnerReviewsAvg!
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${cubit.categoryDetailsModel!.data!
                                                  .partners![index].partnerReviewsAvg!} (${cubit.categoryDetailsModel!.data!
                                                  .partners![index].partnerReviewsTotal!} review)',
                                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                        
                                          ],
                                        ),
                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ).animate().fadeIn(duration: 100.ms).then(delay: 0.ms).fade(),
                  );
                },
              );
            case Status.noInternet:
              return  NoInternetWidget(onPressed: (){
                cubit.getCategoryDetails(id: id);
              });
            default:
              return const Icon(Icons.error);

          }

        },
      ),
    );
  }
}
