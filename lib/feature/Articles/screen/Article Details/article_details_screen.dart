import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Article%20Details/widget/article_details_widget.dart';

import '../../../../core/constant/constant.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final String articleId;
  final String title;

  const ArticleDetailsScreen({super.key, required this.articleId,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:  BlocBuilder<ArticleCubit, ArticleState>(
        buildWhen: (previous, current) =>
        previous.articleDetailsStatus != current.articleDetailsStatus,
        builder: (context, state) {
          var cubit = context.read<ArticleCubit>();

          switch (state.articleDetailsStatus) {
            case Status.loading:
              return BuildLoadingWidget();
            case Status.success:
              return ArticleDetailsWidget(
                image: cubit.articleModel!.data!.page!.pagePic!,
                title:  cubit.articleModel!.data!.page!.pageName!,
                description:  cubit.articleModel!.data!.page!.pageDescription!,
                time: cubit.articleModel!.data!.page!.pageTime!,
                date: cubit.articleModel!.data!.page!.pageDate!,
              );
            case Status.noInternet:
              return NoInternetWidget(onPressed: (){
                cubit.getArticleDetailsData(id: articleId);
              });
            default:
              return const Center(
                child: Icon(Icons.error),
              );
          }
        },
      ),
    );
  }
}
