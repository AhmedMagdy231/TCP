import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';

import '../../../../../core/widgets/product Item Widget/build_product_item.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Home/screen/widget/title_widget.dart';
import '../../../cubit/article_cubit.dart';
import '../../../model/article_model.dart';
import '../article_details_screen.dart';

class ArticleDetailsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String date;
  final String time;
  final List<SimilarPages> similarPages;

  const ArticleDetailsWidget(
      {super.key,
      required this.image,
      required this.date,
      required this.time,
      required this.title,
      required this.description,
        required this.similarPages,
      });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            SizedBox(
              width: width,
              child: Card(
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    BuildImage(
                      image: image,
                      radius: 12,
                      borderAll: false,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.01),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.date_range),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    formatDate(date),
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.access_time_outlined),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    formatTime(
                                      int.parse(time),
                                    ),
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          HtmlWidget(
                            description,
                            textStyle: GoogleFonts.nunito(),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 100.ms).then(delay: 0.ms).fade(),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TitleWidget(
              seeAll: false,
              title: 'Similar Articles',
              onTap: () {
                // context.read<ArticleCubit>().getArticleCategoryData();
                // navigateTo(context, ArticlesCategoryScreen());
              },
            ),
            SizedBox(
              height: height * 0.26,
              width: width,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: similarPages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ArticleCubit>().getArticleDetailsData(id: similarPages[index].pAGEID!);
                      context.read<ArticleCubit>().counter++;
                      navigateTo(
                        context,
                        ArticleDetailsScreen(
                          countPage:  context.read<ArticleCubit>().counter,
                          articleId: similarPages[index].pAGEID!,
                          title: similarPages[index].pageName!,
                        ),
                      );
                    },
                    child: SizedBox(
                      height: height * 0.25,
                      width: width * 0.5,
                      child: BuildProductItem(
                        image: similarPages[index].pagePic!,
                        name: similarPages[index].pageName!,
                        description: similarPages[index].pageDescription!,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(width: width*0.02,);
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),







          ],
        ),
      ),
    );
  }
}
