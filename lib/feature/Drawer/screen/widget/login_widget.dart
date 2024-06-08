import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/feature/Articles/screen/Articles%20Category/articles_category_screen.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Category/screen/Category/category_screen.dart';
import 'package:tricare_patient_application/feature/Drawer%20Screen/About%20Us%20Screen/about_us_screen.dart';
import 'package:tricare_patient_application/feature/Drawer%20Screen/Tos%20Screen/tos_screen.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/Carousel Widget/build_list_title.dart';
import '../../../Articles/cubit/article_cubit.dart';
import '../../../Bookmark/screens/bookmark_screen.dart';
import 'top_widget.dart';


class DrawerLoginWidget extends StatelessWidget {
  const DrawerLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        TopWidget(
          height: height,
          width: width,
          image: context.read<ProfileCubit>().userModel!.data!.patient!.patientProfilepicture!,
          email: context.read<ProfileCubit>().emailController.text,
          name: context.read<ProfileCubit>().nameController.text,
        ),

        BuildListTitle(
          text: 'Profile',
          iconName: 'person.svg',
          function: () {
            Navigator.pop(context);
            context.read<GlobalCubit>().goToScreenAtIndex(2);
          },
        ),
        BuildListTitle(
          text: 'Specialties',
          iconName: 'category.svg',
          function: () {

            context.read<CategoryCubit>().getCategoryData();
            navigateTo(context, CategoryScreen());
          },
        ),
        BuildListTitle(
          text: 'Favorite',
          iconName: 'favorite.svg',
          function: () {
            navigateTo(context, BookMarkScreen());
          },
        ),
        BuildListTitle(
          text: 'Articles',
          iconName: 'page.svg',
          function: () {

            context.read<ArticleCubit>().getArticleCategoryData();
            navigateTo(context, ArticlesCategoryScreen());
          },
        ),
        BuildListTitle(
          text: 'About Us',
          iconName: 'about_us.svg',
          function: () {

            context.read<DrawerCubit>().getAboutUsData();
            navigateTo(context, AboutUsScreen());
          },
        ),
        BuildListTitle(
          text: 'Terms and Conditions',
          iconName: 'term.svg',
          function: () {
            context.read<DrawerCubit>().getTosData();
            navigateTo(context, TosScreen());
          },
        ),
        BuildListTitle(
          text: 'Log Out',
          iconName: 'logout.svg',
          function: () {

            var snackBar = Utils.buildSnackBar2(
              context: context,
              contentType: ContentType.success,

              message: 'Logout Successfully',
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            context.read<ProfileCubit>().logOut();

            Navigator.of(context).pop();

          },
        ),


      ],
    );
  }
}
