import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 void toastMessage(String? message,context, {Color? color}){
   Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}