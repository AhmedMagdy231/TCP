import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import 'widget/article_category_details_widget.dart';

class ArticlesCategoryDetailsScreen extends StatelessWidget {
  final String id;
  final String title;

  const ArticlesCategoryDetailsScreen({super.key, required this.id, required this.title});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: BlocBuilder<ArticleCubit,ArticleState>(
       buildWhen: (previous, current) => previous.articleCategoryDetailsStatus != current.articleCategoryDetailsStatus,
        builder: (context,state){
          var cubit = context.read<ArticleCubit>();

          switch(state.articleCategoryDetailsStatus){

            case  Status.loading || Status.initial:
              return BuildLoadingWidget();
            case Status.success:
              return ArticleCategoryDetailsWidget(
                height: height,
                width: width,
                pages: cubit.articlesCategoryDetailsModel!.data!.pages!,
              );
            case Status.noInternet:
              return NoInternetWidget(
                  onPressed: (){
                cubit.getArticleCategoryDetailsData(id: id);
              });
            default:
              return const Center(child: Icon(Icons.error),);
          }
        },
      ),


    );
  }
}
