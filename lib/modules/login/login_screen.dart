import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_shopping/modules/login/login_cubit/login_cubit.dart';
import 'package:go_shopping/modules/register/register_screen.dart';
import 'package:go_shopping/modules/shop_layout/shop_layout.dart';
import 'package:go_shopping/shared/components/components.dart';
import 'package:go_shopping/shared/network/local/cache_helper.dart';
import 'package:go_shopping/shared/styles/colors.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if(state.loginModel.status!)
            {
              debugPrint("Status true token===${state.loginModel.data!.token}");
              debugPrint("Status true message===${state.loginModel.message}");

              CacheHelper.saveData(key: 'token',
                  value: state.loginModel.data!.token).then((value) {
                navigateAndFinish(context, const ShopLayout());
              });

              showToast(text: state.loginModel.message!,
                  state: ToastStates.SUCCESS);
            }else{
              /// TODO why toast error dont show
              debugPrint("Status false(no user)===${state.loginModel.message}");
             showToast(text: state.loginModel.message!,
                 state: ToastStates.ERROR);
            }
          }
          if (state is LoginErrorState) {
            print("error stateeeeee${state.error}");
            snackBar(
              context: context,
              message:  state.error.toString(),
              state: SnackBarStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: blackColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'login now to browse our offers',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: greyColor,
                                    ),
                          ),
                        ),
                        DefaultFormFeild(
                          prefix: Icons.email_outlined,
                          label: 'Email Address',
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email address or phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DefaultFormFeild(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          suffixPressed: () {
                            LoginCubit.get(context).changeVisibility();
                          },
                          label: 'Password',
                          onSubmet: (value){
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          isPassword:LoginCubit.get(context).isPassword,
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          fallback: (BuildContext context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          condition: state is! LoginLoadingState,
                          builder: (BuildContext context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'login',
                              isUppercase: true),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            DefaultTextButton(
                                function: () {
                                  navigateTo(context, const RegisterScreen());
                                },
                                text: 'Register'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
