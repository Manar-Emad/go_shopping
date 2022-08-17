import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_shopping/models/login_model.dart';
import 'package:go_shopping/shared/network/end_points.dart';
import 'package:go_shopping/shared/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);


  LoginModel? loginModel;
  void userLogin({required String email,required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        }
    ).then((value) {
      debugPrint('user login data success===${value.data}');
      loginModel = LoginModel.fromJson(value.data);
      debugPrint('token===${loginModel!.data!.token}');
      debugPrint('status===${loginModel!.status}');
      debugPrint('status===${loginModel!.message}');
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      debugPrint('user login data error===${loginModel!.message}');
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changeVisibility(){
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_off_outlined : Icons.visibility_outlined ;
  emit(ChangePasswordVisibilityState());
  }
}
