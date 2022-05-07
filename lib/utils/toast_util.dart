
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static showToast(String msg,
      {Color? textColor, backgroundColor, toastLength}) {
    Fluttertoast.showToast(
        msg: msg,
        textColor: textColor ?? Colors.white,
        backgroundColor: backgroundColor ?? Colors.redAccent,
        toastLength: toastLength ?? Toast.LENGTH_SHORT);
  }
}
