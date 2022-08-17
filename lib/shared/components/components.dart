
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// snackBar Widget
snackBar({
  context,
  String? message,
  required SnackBarStates state,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
      duration: const Duration(seconds: 2),
      backgroundColor: chooseSnackBarColor(state),
      padding: const EdgeInsets.all(10),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ) ,
    ),
  );
}
///enum for snackBar
enum SnackBarStates{SUCCESS , ERROR ,WARNING}

Color? chooseSnackBarColor(SnackBarStates state){
  Color color;
  switch(state){
    case SnackBarStates.SUCCESS :
      color= Colors.green;
      break ;
    case SnackBarStates.ERROR :
      color= Colors.red;
      break ;
    case SnackBarStates.WARNING :
      color= Colors.amber;
      break ;

  }
  return color;
}


Widget defaultButton({
  width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback function,
  required String text,
  bool isUppercase = true,
}) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget DefaultTextButton({required Function()? function, required String text}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );

Widget DefaultFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmet,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmet,
      enabled: isClickable,
      onChanged: onChange,
      onTap: onTap,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    // انا هنا بقوله عاوز الراوتس اللي فاتت تفضل موجودة ولا نشيلها
    (Route<dynamic> route) => false);

///SHOW TOAST MESSAGE
void showToast({required String text,required ToastStates state})
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
///enum
enum ToastStates{SUCCESS , ERROR ,WARNING}

Color? chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS :
     color= Colors.green;
      break ;
    case ToastStates.ERROR :
      color= Colors.red;
      break ;
    case ToastStates.WARNING :
      color= Colors.amber;
      break ;

  }
  return color;
}
