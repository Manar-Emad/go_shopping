
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Widget DefaultButton({
  width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback function,
  required String text,
  bool isUppercase = true,
}) =>
    Container(
      width: width,
      height: 40,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: background,
      ),
    );

Widget DefaultTextButton({required Function function, required String text}) =>
    TextButton(
      onPressed: () {},
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
      //  validator: (String value) {
      //     if (value.isEmpty) {
      //       return 'email must not be empty';
      //    }
      //  return null;
      // },
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
void showToast({required String text,required ToastStates state}){
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
