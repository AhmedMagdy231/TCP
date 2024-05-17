import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricare_patient_application/core/InputField/custom%20input/search_input_filed.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';

import 'package:tricare_patient_application/core/widgets/Not%20Found%20In%20Search/not_found_in_search.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category/widget/loading_shimmer.dart';

import 'widget/category_widget.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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

            CategoryWidget(),


          ],
        ),
      ),

    );
  }
}
