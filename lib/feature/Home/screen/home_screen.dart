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
import '../../Articles/screen/Articles Category/articles_category_screen.dart';
import '../../HomeLayout/cubit/app_cubit.dart';
import 'widget/search_widget.dart';
import 'widget/title_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  List<String> images = [
    'https://www.shutterstock.com/image-photo/medicine-healthcare-people-concept-female-600nw-2188588635.jpg',
    'https://www.shutterstock.com/image-photo/smiling-young-female-doctor-shake-600nw-1930973966.jpg',
    'https://www.shutterstock.com/image-photo/female-doctor-holding-application-form-600nw-158366573.jpg',
  ];


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
          const BuildLoadingWidget():
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

                  const GetStarted(),

                  TitleWidget(
                    title: 'Specialties',
                    onTap: () {
                      context.read<CategoryCubit>().getCategoryData();
                      navigateTo(context, const CategoryScreen());
                    },
                  ),

                  BuildCategoriesWidget(
                    categories: cubit.homeModel!.data!.specialties!,
                  ),

                  TitleWidget(
                    title: 'Articles',
                    onTap: () {
                      context.read<ArticleCubit>().getArticleCategoryData();
                      navigateTo(context, ArticlesCategoryScreen());
                    },
                  ),

                  ArticlesWidget(
                      articles: cubit.homeModel!.data!.latestPages!),

                  const TitleWidget(
                    title: 'Top Doctor',
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
