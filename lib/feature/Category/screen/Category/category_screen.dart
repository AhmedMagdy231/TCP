import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tricare_patient_application/core/InputField/custom%20input/search_input_filed.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:tricare_patient_application/core/constant/constant.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';

import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';


import '../../../../core/component/TextField/text_form_field.dart';
import '../../../../core/functions/fucntions.dart';

import '../../../../core/widgets/Not Found In Search/not_found_in_search.dart';
import '../../../../generated/l10n.dart';
import '../../../Home/model/home_model.dart';
import '../Category Details/category_details.dart';
import 'widget/loading_shimmer.dart';


class CategoryScreen extends StatefulWidget {


  const CategoryScreen({super.key,});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

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
      appBar: AppBar(
        title:  Text(S.of(context).categories),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            BuildTextFormField(
              controller: searchController,
              hintText: S.of(context).searchAtSpeciality,
              prefixIcon: Icon(Icons.search),
              contendPadding: EdgeInsets.symmetric(
                vertical: height*0.0,
                horizontal: width*0.06 ,
              ),
              onchange: (value) {
                context.read<CategoryCubit>().searchAtSpecialties(value);
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
               switch(state.categoryStatus){
                 case Status.initial || Status.loading:
                   return LoadingSimmerWidget();
                 case Status.success:
                   return  context.read<CategoryCubit>().filterSpecialties!.isEmpty ? Expanded(
                     child:  NoItemInSearch(
                       text: S.of(context).notFoundAnySpecialityWithThisName,
                     ),
                   )
                       :Expanded(
                     child: ListView.builder(
                       itemCount: context.read<CategoryCubit>().filterSpecialties!.length,
                       itemBuilder: (context, index) {
                         return InkWell(
                           onTap: () {
                             context.read<CategoryCubit>().getCategoryDetails(
                                 id: context.read<CategoryCubit>().filterSpecialties![index].sPECIALTYID);
                             navigateTo(
                                 context,
                                 CategoryDetails(
                                   title: context.read<CategoryCubit>().filterSpecialties![index].specialtyTitle!,
                                   id: context.read<CategoryCubit>().filterSpecialties![index].sPECIALTYID!,
                                 ));
                           },
                           child: SizedBox(
                             height: height * 0.1,
                             child: Card(
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(15),
                                     child: BuildImage(
                                       image: context.read<CategoryCubit>().filterSpecialties![index].specialtyPic!,
                                     ),
                                   ),
                                   Text(
                                     context.read<CategoryCubit>().filterSpecialties![index].specialtyTitle!,
                                     style:
                                     Theme.of(context).textTheme.titleSmall,
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         );
                       },
                     ),
                   );
                 case Status.failure:
                   return BuildErrorWidget(error: S.of(context).someThingError);
                 default:
                   return SizedBox();
               }
              },
            ),
          ],
        ),
      ),
    );
  }
}
