import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/widgets/Error%20Widget/error_widget.dart';
import 'package:tricare_patient_application/core/widgets/No%20Internet%20Widget/no_internet_widget.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Home/screen/widget/articles_widget.dart';
import 'package:tricare_patient_application/feature/Home/screen/widget/categories.dart';
import 'package:tricare_patient_application/feature/Home/screen/widget/get_start_widget.dart';
import 'package:tricare_patient_application/feature/Home/screen/widget/great_perosn.dart';
import 'package:tricare_patient_application/feature/Home/screen/widget/top_partner_widget.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category/category_screen.dart';
import '../../../generated/l10n.dart';
import '../../Articles/screen/Articles Category/articles_category_screen.dart';
import '../../HomeLayout/cubit/app_cubit.dart';
import 'widget/loading_shimmer.dart';
import 'widget/search_widget.dart';
import 'widget/title_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var cubit = context.read<AppCubit>();
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {

          return state is NoInternetConnectionHome?
          NoInternetWidget(onPressed: (){
            cubit.getHomeData();
          }) :
          cubit.homeModel == null?
          const BuildLoadingShimmerWidget():
          cubit.homeModel!.hasError?
          BuildErrorWidget(error: cubit.homeModel!.errors.join(' ')):
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GreatPerson(),
                  const SearchHomeWidget(),
                  SizedBox(height: height * 0.01,),


                  // CarouselSliderWidget(
                  //   width: double.infinity,
                  //   height: height,
                  //   images: cubit.homeModel!.data!.images,
                  //
                  // ),

                   GetStarted(
                    image: cubit.homeModel!.data!.staticDescription!.picture!,
                     title: cubit.homeModel!.data!.staticDescription!.title!,

                  ),

                  TitleWidget(
                    title: S.of(context).specialties,
                    onTap: () {
                      context.read<CategoryCubit>().getCategoryData();
                      navigateTo(context,  CategoryScreen());
                    },
                  ),

                  BuildCategoriesWidget(
                    categories: cubit.homeModel!.data!.specialties!,
                  ),

                  TitleWidget(
                    title: S.of(context).articles,
                    onTap: () {
                      context.read<ArticleCubit>().getArticleCategoryData();
                      navigateTo(context, ArticlesCategoryScreen());
                    },
                  ),

                  ArticlesWidget(
                      articles: cubit.homeModel!.data!.latestPages!),

                   TitleWidget(
                    title: S.of(context).topDoctor,
                    seeAll: false,
                  ),

                  TopPartnerWidget(
                      partnerTops: cubit.homeModel!.data!.partnersTops!),
                  SizedBox(height: height * 0.03,),


                ],
              ),
            ),
          );


        },
      ),
    );
  }
}
