import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Articles%20Category/articles_category_screen.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/Login/login_screen.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category/category_screen.dart';
import 'package:tricare_patient_application/feature/Drawer%20Screen/About%20Us%20Screen/about_us_screen.dart';
import 'package:tricare_patient_application/feature/Drawer%20Screen/Tos%20Screen/tos_screen.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';
import 'package:tricare_patient_application/feature/Drawer/screen/widget/social_url_widget.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../../generated/l10n.dart';
import '../../../Articles/cubit/article_cubit.dart';
import 'top_widget.dart';


class DrawerUnLoginWidget extends StatelessWidget {
  const DrawerUnLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        Container(
            height: height*0.3,
            width: width,
            color: Colors.white,
            padding: EdgeInsets.all(width*0.08),
            child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,)),


        BuildListTitle(
          text: S.of(context).specialties,
          iconName: 'category.svg',
          function: () {

            context.read<CategoryCubit>().getCategoryData();
            navigateTo(context, CategoryScreen());
          },
        ),
        BuildListTitle(
          text: S.of(context).articles,
          iconName: 'page.svg',
          function: () {

            context.read<ArticleCubit>().getArticleCategoryData();
            navigateTo(context, ArticlesCategoryScreen());
          },
        ),
        BuildListTitle(
          text: S.of(context).aboutUs,
          iconName: 'about_us.svg',
          function: () {

            context.read<DrawerCubit>().getAboutUsData();
            navigateTo(context, AboutUsScreen());
          },
        ),
        BuildListTitle(
          text: S.of(context).termsAndConditions,
          iconName: 'term.svg',
          function: () {
            context.read<DrawerCubit>().getTosData();
            navigateTo(context, TosScreen());
          },
        ),
        BuildListTitle(
          text: S.of(context).login,
          iconName: 'login.svg',
          function: () {
           navigateTo(context, LoginScreen());


          },
        ),
        BuildListTitle(
          text: S.of(context).changeLanguage,
          iconName: 'language.svg',
          function: () {

            Utils.changeLanguageDialog(context: context, width: width, height: height);

          },
        ),

        Spacer(),

        Divider(),
        SocialUrlWidget(),


      ],
    );
  }
}
