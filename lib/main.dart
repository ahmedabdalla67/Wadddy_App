import 'package:bloc/bloc.dart';
import 'package:first_app/layout/news_app/cubit/news_cubit.dart';
import 'package:first_app/layout/news_app/cubit/news_states.dart';
import 'package:first_app/layout/news_app/news_layout.dart';
import 'package:first_app/layout/waddy_app/cubit/cubit.dart';
import 'package:first_app/layout/waddy_app/waddy_layout_screen.dart';
import 'package:first_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:first_app/modules/to_do_app/todo_app/todo_layout.dart';
import 'package:first_app/modules/counter/Container.dart';
import 'package:first_app/modules/bmi_app/bmi_result/bmi_result_screen.dart';
import 'package:first_app/modules/basics/users/users.dart';
import 'package:first_app/modules/waddy_app/check_rate/check_rate_screen.dart';
import 'package:first_app/modules/waddy_app/help_center/help_center_screen.dart';
import 'package:first_app/modules/waddy_app/home/home_screen.dart';
import 'package:first_app/modules/waddy_app/notification/notification_screen.dart';
import 'package:first_app/modules/waddy_app/splash/first_splash.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_login/waddy_login_screen.dart';
import 'package:first_app/modules/waddy_app/splash/waddy_on_boarding_screen.dart';
import 'package:first_app/shared/components/cubit_observer.dart';
import 'package:first_app/shared/cubit/app_cubit.dart';
import 'package:first_app/shared/cubit/app_states.dart';
import 'package:first_app/shared/network/local/cache_helper.dart';
import 'package:first_app/shared/network/remote/dio_helper.dart';
import 'package:first_app/shared/styles/themes.dart';
import 'package:first_app/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'firstSplash');

  Widget widget;

  String? token = CacheHelper.getData(key: 'token');
  if(onBoarding != null)
    {
      if(token != null) {
        widget = const Waddylayout();
      } else {
        widget = WaddyLoginScreen();
      }
    }else
      {
        widget = WaddyOnBoardingScreen();
      }



  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget
{
  final bool? isDark;
  final Widget? startWidget;

  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context)
  {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(
            fromShared: isDark
        ),),
        BlocProvider(create: (BuildContext context) => NewsCubit()..getBusiness(),),
        BlocProvider(create: (BuildContext context) => ShippingCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            // darkTheme: darkTheme,
            // themeMode:AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: CheckRateScreen(),
            //HelpCenterScreen(),
            //NotificationScreen(),
            //NewsLayout(),
            //FirstSplash(),
            //startWidget,
          );
        },
      ),
    );
  }

}
