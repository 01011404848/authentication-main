import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> myToast({required String text , required ToastStates state}) => Fluttertoast.showToast(
msg: text,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
backgroundColor: choseToastColor(state),
textColor: Colors.white,
fontSize: 16.0
);

enum ToastStates {SUCCESS ,ERROR,WARNING}

Color choseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
      case ToastStates.ERROR:
      color = Colors.red;
    break;
    case ToastStates.WARNING:
    color = Colors.amber;
    break;
  }
  return color;
}