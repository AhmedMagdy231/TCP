import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/widgets/Build%20GridView/build_grid_view.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Article%20Details/article_details_screen.dart';

import '../../../../../core/functions/fucntions.dart';
import '../../../../../core/widgets/product Item Widget/build_product_item.dart';
import '../../../model/article_category_details_model.dart';
import '../../../model/article_category_model.dart';

class ArticleCategoryDetailsWidget extends StatelessWidget {
  final List<Pages> pages;
  final double width;
  final double height;

  const ArticleCategoryDetailsWidget({
    super.key,
    required this.pages,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: BuildGridView(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context
                  .read<ArticleCubit>()
                  .getArticleDetailsData(id: pages[index].pAGEID!);
              context.read<ArticleCubit>().counter++;
              navigateTo(
                context,
                ArticleDetailsScreen(
                  countPage:  context.read<ArticleCubit>().counter,
                  articleId: pages[index].pAGEID!,
                  title: pages[index].pageName!,
                ),
              );
            },
            child: BuildProductItem(
              name: pages[index].pageName!,
              image: pages[index].pagePic!,
              description: cleanHtmlToPlainText(pages[index].pageDescription!),
            ),
          ).animate().fadeIn(duration: 100.ms).then(delay: 0.ms).fade();
        },
      ),
    );
  }
}
