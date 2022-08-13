import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_shopping/modules/intro.dart';
import 'package:go_shopping/modules/shop_layout/shop_layout.dart';
import 'package:go_shopping/shared/app_cubit/cubit.dart';
import 'package:go_shopping/shared/app_cubit/states.dart';
import 'package:go_shopping/shared/bloc_observer.dart';
import 'package:go_shopping/shared/network/local/cache_helper.dart';
import 'package:go_shopping/shared/network/remote/dio_helper.dart';
import 'package:go_shopping/shared/styles/themes.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  ///uid = CacheHelper.getDate(key: 'uid');

  DioHelper.init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
        () {
      AppCubit();},
    blocObserver: MyBlocObserver(),
  );
  bool? onBoarding=CacheHelper.getData(key:'onBoarding');
  String? token=CacheHelper.getData(key:'token');
  Widget widget;

  if(onBoarding !=null ){
    if(token !=null) {
      widget=const ShopLayout();
    } else{widget=  IntroScreen();}
  }else{widget= OnBoardingScreen();}


  runApp(  MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        )
      ],
      ///todo show is Error or true???
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:lightTheme,
            themeMode:
            AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme:darkTheme,
            home: startWidget,
          );
        },
      ),
    );
    //     },
    //   ),
    // );
  }
}

