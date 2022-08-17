import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_shopping/shared/app_cubit/states.dart';
import 'package:go_shopping/shared/network/local/cache_helper.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  IconData iconMode = Icons.mode;
  bool isDark = false;
///TODO dark mode give me a null value
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      iconMode = isDark ? Icons.dark_mode_outlined: Icons.mode ;
      debugPrint("theme mode from shared===$isDark");
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      debugPrint("theme mode frommmmmm shared===$isDark");
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(ChangeAppModeState());
      });
    }
  }
}

