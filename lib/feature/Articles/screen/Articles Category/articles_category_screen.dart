import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/No Internet Widget/no_internet_widget.dart';
import 'widget/article_category_widget.dart';
import 'widget/loading_shimmer.dart';

class ArticlesCategoryScreen extends StatelessWidget {

  const ArticlesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),

      body: BlocBuilder<ArticleCubit,ArticleState>(
        buildWhen: (previous, current) => previous.articleCategoryStatus != current.articleCategoryStatus,
        builder: (context,state){
          var cubit = context.read<ArticleCubit>();

          switch(state.articleCategoryStatus){

            case  Status.loading:
              return LoadingShimmerWidget();
            case Status.success:
              return ArticleCategoryWidget(
                height: height,
                width: width,
                cubit: cubit,
                pagesCats: cubit.articleCategoryModel!.data!.pagesCats!,
              );
            case Status.noInternet:
              return NoInternetWidget(onPressed: (){
                cubit.getArticleCategoryData();
              });
            default:
              return Center(child: Icon(Icons.error),);
          }
        },
      ),


    );
  }
}
