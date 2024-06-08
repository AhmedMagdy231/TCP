import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/functions/fucntions.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/widgets/Carousel%20Widget/build_list_title.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/Login/login_screen.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Main%20Profile/widget/social_widget.dart';
import 'package:tricare_patient_application/feature/Profile/screen/Profile/profile_screen.dart';

import '../../../../core/Global Cubit/global_cubit.dart';
import '../../../../core/component/components.dart';
import '../../../../core/utils/utils.dart';
import '../../../Authentication/Goolge/google.dart';
import '../../../Bookmark/screens/bookmark_screen.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int selectOption = context.read<GlobalCubit>().selectOption;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocBuilder<DrawerCubit,DrawerState>(

          builder: (BuildContext context, DrawerState state) {
            return context.read<DrawerCubit>().settingUrlModel == null?
            BuildShimmer(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (context,index){
                    return   BuildListTitle(
                      text: 'Loading...',
                      iconName: 'loading.svg',
                      function: (){},
                    );
                  }
              ),
            )  :
            Column(
              children: [
                BuildListTitle(
                  text: 'Profile',
                  iconName: 'user.svg',
                  function: () {
                    navigateTo(context, ProfileScreen());
                  },
                ),
                BuildListTitle(
                  text: 'Change Language',
                  iconName: 'language.svg',
                  function: () {

                    showDialog(

                        context: context,

                        builder: (context){

                          return AlertDialog(

                            //surfaceTintColor: DarkAppColor.foreGroundColors,
                            title:  Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Change Language',
                              ),
                            ),

                            content: StatefulBuilder(
                              builder: (BuildContext ctx, StateSetter setState){
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [


                                    RadioListTile(
                                      title:  Text(
                                          'English',
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      value: 1,
                                      groupValue: selectOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectOption = value!;
                                        });
                                      },

                                    ),
                                    RadioListTile(
                                      title:  Text(
                                        "العربية",
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),

                                      value: 2,
                                      groupValue: selectOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectOption = value!;
                                        });
                                      },

                                    ),
                                    SizedBox(height: height*0.03,),
                                    ElevatedButton(

                                      onPressed: () async {
                                        await  context.read<GlobalCubit>().changeLocal(
                                          value: selectOption,
                                        );
                                        context.read<AppCubit>().getHomeData();

                                        Navigator.pop(ctx);
                                      },
                                      child: Text('Save'),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(width, height*0.06),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                    );

                  },
                ),
                BuildListTitle(
                  text: 'Favorite',
                  iconName: 'favorite.svg',
                  function: () {
                    navigateTo(context, BookMarkScreen());
                  },
                ),

                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return BuildListTitle(
                      text: CashHelper.getData(key: 'login') == null
                          ? 'Login'
                          : 'Log out',
                      iconName: CashHelper.getData(key: 'login') == null
                          ? 'login.svg'
                          : 'logout.svg',
                      function: () {
                        if (CashHelper.getData(key: 'login') == null) {
                          navigateTo(context, LoginScreen());
                        }
                        else {
                          var snackBar = Utils.buildSnackBar2(
                            context: context,
                            contentType: ContentType.success,

                            message: 'Logout Successfully',
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          context.read<ProfileCubit>().logOut();

                        }
                      },
                    );
                  },
                ),

                SocialProfileWidget(),

              ],
            );
          },

        ),
    );
  }
}
