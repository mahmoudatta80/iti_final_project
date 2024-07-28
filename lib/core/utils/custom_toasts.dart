import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_final_project/core/themes/my_colors.dart';

class CustomToasts {
  static showErrorToast({
    required String errorMessage,
  }) {
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static showSuccessToast({
    required String successMessage,
  }) {
    Fluttertoast.showToast(
      msg: successMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: MyColors.mainBlue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
