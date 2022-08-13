import 'package:flutter/material.dart';
import 'package:go_shopping/shared/app_cubit/cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: IconButton(icon: Icon(Icons.mode),onPressed: (){
            AppCubit.get(context).changeAppMode() ;
          }),),
        ],
      ),
    );
  }
}
