import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_shopping/modules/login/login_screen.dart';
import 'package:go_shopping/modules/shop_layout/shop_layout.dart';
import 'package:go_shopping/shared/app_cubit/cubit.dart';
import 'package:go_shopping/shared/app_cubit/states.dart';
import 'package:go_shopping/shared/bloc_observer.dart';
import 'package:go_shopping/shared/network/local/cache_helper.dart';
import 'package:go_shopping/shared/network/remote/dio_helper.dart';
import 'package:go_shopping/shared/styles/themes.dart';
import 'draft.dart';
import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///uid = CacheHelper.getDate(key: 'uid');

  DioHelper.init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      AppCubit();
    },
    blocObserver: MyBlocObserver(),
  );

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool? isDark = CacheHelper.getData(key: 'isDark');
  String? token = CacheHelper.getData(key: 'token');
  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp(
    startWidget: widget,

    ///todo theme isDark give me a null value
    isDark:isDark!,
    //isDark: false,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({required this.startWidget, required this.isDark});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
            // onBoarding?LoginScreen() :OnBoardingScreen(),
          );
        },
      ),
    );
    //     },
    //   ),
    // );
  }
}
