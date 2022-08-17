import 'package:flutter/material.dart';
import 'package:go_shopping/modules/login/login_screen.dart';
import 'package:go_shopping/shared/app_cubit/cubit.dart';
import 'package:go_shopping/shared/components/components.dart';
import 'package:go_shopping/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Salla"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(icon: const Icon(Icons.dark_mode_outlined),
                onPressed: (){
                  AppCubit.get(context).changeAppMode() ;
                }),
          )
        ],
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            CacheHelper.removeData(key: 'token').then((value) {
              if(value!){
                navigateAndFinish(context,LoginScreen() );
                debugPrint("Signed Out Successfully");
              }
            });
          }, child: Text("Siign Out")),
        ],
      ),
    );
  }
}
