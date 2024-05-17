import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Articles%20Category%20Details/articles_category_details_screen.dart';

import '../../../../../core/functions/fucntions.dart';
import '../../../../../core/widgets/Build GridView/build_grid_view.dart';
import '../../../../../core/widgets/product Item Widget/build_product_item.dart';
import '../../../model/article_category_model.dart';

class ArticleCategoryWidget extends StatelessWidget {
  final List<PagesCats> pagesCats;
  final double width;
  final double height;
  final ArticleCubit cubit;

  const ArticleCategoryWidget({
    super.key,
    required this.pagesCats,
    required this.height,
    required this.width,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: BuildGridView(
        itemCount: pagesCats.length,
        itemBuilder:  (context, index) {
          return GestureDetector(
              onTap: () {
                cubit.getArticleCategoryDetailsData(id: pagesCats[index].pAGESCATID!);
                navigateTo(
                  context,
                  ArticlesCategoryDetailsScreen(
                    id: pagesCats[index].pAGESCATID!,
                    title:  pagesCats[index].pagescatTitle!,
                  ),
                );
              },
              child: BuildProductItem(
                name: pagesCats[index].pagescatTitle!,
                image: pagesCats[index].pagescatPic!,
                description:
                cleanHtmlToPlainText(pagesCats[index].pagescatDescription!),
              ).animate().fadeIn(duration: 100.ms).then(delay: 0.ms).fade(),
          );
        }
        ),
      );
  }
}





