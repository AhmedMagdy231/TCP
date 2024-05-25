import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricare_patient_application/core/InputField/custom%20input/search_input_filed.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';

import 'package:tricare_patient_application/core/widgets/Not%20Found%20In%20Search/not_found_in_search.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category/widget/loading_shimmer.dart';

import '../../../../core/functions/fucntions.dart';
import '../../../Home/model/home_model.dart';
import '../Category Details/category_details.dart';
import 'widget/category_widget.dart';


class CategoryScreen extends StatelessWidget {
  final  List<Specialties> specialties;
  const CategoryScreen({super.key,required this.specialties});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.02),
        child: Column(
          children: [
            SearchFiled(
                      controller: TextEditingController(),
                      hint: 'Search...',
                      onchange: (value){
                        context.read<CategoryCubit>().searchAtSpecialties(value);
                      },

                    ),
            SizedBox(height: height*0.02,),

            Expanded(
              child:  ListView.builder(
                itemCount: specialties.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      context.read<CategoryCubit>().getCategoryDetails(id:  specialties[index].sPECIALTYID);
                      navigateTo(context, CategoryDetails(
                        title:  specialties[index].specialtyTitle!,
                        id: specialties[index].sPECIALTYID!,
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
                                  specialties[index].specialtyPic!,
                                ),
                              ),
                              Text(
                                specialties[index].specialtyTitle!,
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
            ),


          ],
        ),
      ),

    );
  }
}
