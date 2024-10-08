import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
import 'package:tricare_patient_application/feature/Book/cubit/book_cubit.dart';
import 'package:tricare_patient_application/feature/Bookmark/cubit/book_mark_cubit.dart';
import 'package:tricare_patient_application/feature/Confirm%20Book%20Appointment/cubit/confirm_book_cubit.dart';
import 'package:tricare_patient_application/feature/Doctor/cubit/doctor_cubit.dart';
import 'package:tricare_patient_application/feature/Drawer/cubit/drawer_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/cubit/app_cubit.dart';
import 'package:tricare_patient_application/feature/HomeLayout/screens/home_layout_screen.dart';
import 'package:tricare_patient_application/feature/Introduction/On%20Boarding%20Screen/onboarding_screen.dart';
import 'package:tricare_patient_application/feature/Category/cubit/category_cubit.dart';
import 'package:tricare_patient_application/feature/Profile/cubit/profile_cubit.dart';
import 'package:tricare_patient_application/feature/Search/cubit/search_cubit.dart';
import 'package:tricare_patient_application/feature/Sessions/cubit/session_cubit.dart';
import 'package:tricare_patient_application/feature/Splach%20Screen/splach_screen.dart';
import 'package:tricare_patient_application/feature/test.dart';

import 'bloc_observer.dart';
import 'core/constant/constant.dart';
import 'core/network/Firebase/notification.dart';
import 'feature/Notification/cubit/notification_cubit.dart';
import 'feature/Notification/screens/notification_screens.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';





void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await CashHelper.initialize();
  await initializeDateFormatting('en');
  await initializeDateFormatting('ar');

  DioHelper.initialize(EndPoints.baseUrl);
  //Bloc.observer = MyBlocObserver();
  // CashHelper.prefs.remove('token');
  // CashHelper.prefs.remove('login');
  // CashHelper.prefs.remove('first');
  //print(CashHelper.getData(key: 'token'));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotification().init();

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
        BlocProvider(create: (context) => ConfirmBookCubit()),
        BlocProvider(create: (context) => ArticleCubit()),
        BlocProvider(create: (context) => BookCubit()),
        BlocProvider(create: (context) => DrawerCubit()..getSettingData()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => SessionCubit()),
        BlocProvider(create: (context) => BookMarkCubit()),
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(create: (context) => AppCubit()..getHomeData()),
        BlocProvider(create: (context) => AuthCubit()),

      ],

      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(context.read<GlobalCubit>().local),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'TriCare',
            debugShowCheckedModeBanner: false,
            theme: AppLightTheme.lightThemeData,
            darkTheme: AppDarkTheme.darkThemeData,
            themeMode: context.read<GlobalCubit>().isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: SplashScreen(),
            navigatorKey: navigationKey,
            routes: {

              '/notification':(context)=>NotificationScreen(),
            },
          );
        },
      ),
    );
  }
}


//SHA1: 0D:20:03:87:F4:65:B3:2C:A1:E4:3A:93:DE:CF:23:3E:C9:81:97:87
//SHA-256: E1:BD:C0:F4:06:30:69:E6:82:75:D4:1C:40:8F:B6:49:C6:8D:52:0A:17:67:98:D1:4A:94:37:4F:8A:35:21:F5


// don't forget to remove every print
// favourite without login
// number of patient and experience in doctor details\
// details not found in article in doctor details
// hero from splash to home layout
