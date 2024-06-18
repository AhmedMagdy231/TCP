import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tricare_patient_application/core/component/Network%20Image/network_image.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/globle/color/shared_color.dart';

import '../../../../../core/widgets/product Item Widget/build_product_item.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Book/cubit/book_cubit.dart';
import '../../../../Home/screen/widget/title_widget.dart';
import '../../../../HomeLayout/cubit/app_cubit.dart';
import '../../../../Search/screen/search by all/search_by_all.dart';
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
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: HtmlWidget(
                              description,
                              textStyle: GoogleFonts.nunito(


                              ),
                            ),
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


            SizedBox(
              height: height*0.2,
              width: width,
              child: Stack(
                children: [
                  Container(
                    height: height*0.2,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage('assets/images/doctor_image.jpg'),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  Container(
                    height: height*0.2,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.primaryColor.withOpacity(0.5),
                            AppColor.primaryColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            S.of(context).doYouNeedHealthcare,
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),

                          Text(
                            S.of(context).youCanBookAnAppointmentWithADoctorInLess,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: height*0.02,),

                          ElevatedButton(
                            onPressed: (){
                              context.read<BookCubit>().getBranches(doctorId: '0');

                              navigateTo(context, SearchByAllScreen(
                                specialties: context.read<AppCubit>().homeModel!.data!.specialties!,

                              ));

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                minimumSize: Size(width*0.3, height*0.05),
                                shadowColor: Colors.grey,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            ),
                            child:  Text(
                              S.of(context).bookAnAppointment,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),


                        ],
                      ),
                    ),

                  ),
                ],
              ),
            ),
            TitleWidget(
              seeAll: false,
              title: S.of(context).similarArticles,
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
