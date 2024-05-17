import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category%20Details/category_details.dart';

import '../../model/home_model.dart';


class BuildCategoriesWidget extends StatelessWidget {
  final List<Specialties> categories;

  const BuildCategoriesWidget({super.key, required this.categories});




  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns


        ),
        itemCount: categories.length,
        itemBuilder: (context,index){
          return  InkWell(
            onTap: (){
              context.read<CategoryCubit>().getCategoryDetails(id: categories[index].sPECIALTYID);
              navigateTo(context, CategoryDetails(
                title: categories[index].specialtyTitle!,
                id:  categories[index].sPECIALTYID!,
              ));
            },
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: BuildImage(
                          image: categories[index].specialtyPic!,

                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  categories[index].specialtyTitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          );
        }
    );
  }
}
