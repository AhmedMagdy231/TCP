import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Article%20Details/widget/article_details_widget.dart';

import '../../../../core/constant/constant.dart';
import '../../model/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {

  final String articleId;
  final String title;
  final int countPage;
  ArticleModel? articleModel;


   ArticleDetailsScreen({super.key, required this.articleId,required this.title,required this.countPage});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        context.read<ArticleCubit>().backArticleDetailsScreen();

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:  BlocBuilder<ArticleCubit, ArticleState>(
          buildWhen: (previous, current){

            return previous.articleDetailsStatus != current.articleDetailsStatus
                && countPage == context.read<ArticleCubit>().counter;
          },
          builder: (context, state) {
            var cubit = context.read<ArticleCubit>();

            switch (state.articleDetailsStatus) {

              case Status.loading:
                return BuildLoadingWidget();
              case Status.success:
                articleModel = cubit.articleModel;
                return ArticleDetailsWidget(
                  image: articleModel!.data!.page!.pagePic!,
                  title:  articleModel!.data!.page!.pageName!,
                  description:  articleModel!.data!.page!.pageDescription!,
                  time: articleModel!.data!.page!.pageTime!,
                  date: articleModel!.data!.page!.pageDate!,
                  similarPages: articleModel!.data!.similarPages!,
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
      ),
    );
  }
}
