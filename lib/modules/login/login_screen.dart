import 'package:flutter/material.dart';
import 'package:go_shopping/modules/register/register_screen.dart';
import 'package:go_shopping/shared/components/components.dart';
import 'package:go_shopping/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LOGIN',style: Theme.of(context).textTheme.headline5,),
            Text('login now to browse our offers',style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: greyColor,
            ),),
            DefaultFormFeild(
              controller:emailController ,
              type: TextInputType.emailAddress,
              label:'Email Address' ,
              validate:(  String value){
                if(value.isEmpty){
                  return 'please enter your email address';}} ,
              prefix:Icons.email_outlined ,
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultFormFeild(
              controller:passwordController ,
              type: TextInputType.visiblePassword,
              suffix: Icons.visibility_off_outlined,
              suffixPressed: (){},
              label:'Password' ,
              validate:(  String value){
                if(value.isEmpty){
                  return 'password is too short';}} ,
              prefix:Icons.lock_outline ,
            ),const SizedBox(
              height: 30,
            ),
            defaultButton(function: (){}, text: 'login',isUppercase: true),const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text('Don\'t have an account?'),
                DefaultTextButton(function: (){}, text: 'Register now',),
                DefaultTextButton(function:(){
                  navigateTo(context,const RegisterScreen() );
                }, text: 'SKIP'),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
