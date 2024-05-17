import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tricare_patient_application/core/Global%20Cubit/global_cubit.dart';
import 'package:tricare_patient_application/core/globle/theme/dark_theme.dart';
import 'package:tricare_patient_application/core/globle/theme/light_theme.dart';
import 'package:tricare_patient_application/core/network/Local/CashHelper.dart';
import 'package:tricare_patient_application/core/network/Remote/DioHelper.dart';
import 'package:tricare_patient_application/core/network/endPoind.dart';
import 'package:tricare_patient_application/feature/Articles/cubit/article_cubit.dart';
import 'package:tricare_patient_application/feature/Authentication/cubit/auth_cubit.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/Login/login_screen.dart';
import 'package:tricare_patient_application/feature/Authentication/screens/OTP/otp_screen.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/screens/home_layout_screen.dart';
import 'package:tricare_patient_application/feature/Introduction/On%20Boarding%20Screen/onboarding_screen.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/test.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await CashHelper.initialize();
  DioHelper.initialize(EndPoints.baseUrl);
  Bloc.observer = MyBlocObserver();
  // CashHelper.prefs.remove('token');
  // CashHelper.prefs.remove('login');
  print(CashHelper.getData(key: 'token'));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GlobalCubit()),
        BlocProvider(create: (context) => ProfileCubit()..postUserData()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => DoctorCubit()),
        BlocProvider(create: (context) => ArticleCubit()),
        BlocProvider(create: (context) => DrawerCubit()),
        BlocProvider(create: (context) => AppCubit()..getHomeData()),
        BlocProvider(
            create: (context) => AuthCubit()),
      ],
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'TriCare',
            debugShowCheckedModeBanner: false,
            theme: AppLightTheme.lightThemeData,
            darkTheme: AppDarkTheme.darkThemeData,
            themeMode: context.read<GlobalCubit>().isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}


