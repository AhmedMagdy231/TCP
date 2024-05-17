import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category%20Details/category_details.dart';

import '../../../../../core/component/Network Image/network_image.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/Not Found In Search/not_found_in_search.dart';
import '../../../cubit/category_cubit.dart';
import 'loading_shimmer.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) => previous.categoryStatus != current.categoryStatus,
      builder: (context, state) {
        var cubit = context.read<CategoryCubit>();

         print(state.categoryStatus);
        switch (state.categoryStatus) {
          case Status.loading:
            return Expanded(child: const LoadingSimmerWidget());
          case Status.success:
            return cubit.filterSpecialties!.isEmpty?
            const NoItemInSearch(text: 'Not Found Any Category with this name'):
            Expanded(
              child:  ListView.builder(
                itemCount: cubit.filterSpecialties!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      cubit.getCategoryDetails(id:  cubit.filterSpecialties![index].sPECIALTYID);
                      navigateTo(context, CategoryDetails(
                          title:  cubit.filterSpecialties![index].specialtyTitle!,
                          id: cubit.filterSpecialties![index].sPECIALTYID!,
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.005),
                      child: SizedBox(
                        height: height * 0.1,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: BuildImage(
                                  image:
                                      cubit.filterSpecialties![index].specialtyPic!,
                                ),
                              ),
                              Text(
                                cubit.filterSpecialties![index].specialtyTitle!,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          case Status.noInternet:
            return  NoInternetWidget(onPressed: (){
              cubit.getCategoryData();
            });
          case Status.failure:
            return const BuildErrorWidget(error: 'Some Thing Error');
          default:
            return Icon(Icons.error);
        }

      },
    );
  }
}
