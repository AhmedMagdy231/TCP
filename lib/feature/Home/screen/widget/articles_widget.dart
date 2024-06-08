import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Article%20Details/article_details_screen.dart';

import '../../../../core/widgets/product Item Widget/build_product_item.dart';
import '../../model/home_model.dart';

class ArticlesWidget extends StatelessWidget {
  final List<LatestPages> articles;

  const ArticlesWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.26,
      width: width,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<ArticleCubit>().getArticleDetailsData(id: articles[index].pAGEID!);
                context.read<ArticleCubit>().counter++;
                navigateTo(
                  context,
                  ArticleDetailsScreen(
                    countPage:  context.read<ArticleCubit>().counter,
                    articleId: articles[index].pAGEID!,
                    title: articles[index].pageName!,
                  ),
                );

              },
              child: SizedBox(
                height: height * 0.25,
                width: width * 0.5,
                child: BuildProductItem(
                  image: articles[index].pagePic!,
                  name: articles[index].pageName!,
                  description: articles[index].pageDescription!,
                ),
              ),
            );
          },
          separatorBuilder: (context,index){
            return SizedBox(width: width*0.02,);
          },
          ),
    );
  }
}
