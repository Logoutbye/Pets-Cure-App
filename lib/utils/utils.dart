import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_practice_app/res/colors.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

class Utils {
  static void fieldfocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  // flutter toast message
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: MyColors.kSecondary,
        textColor: MyColors.kPrimary);
  }

  // flutter flushbar
  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          //positionOffset: 50,

          borderRadius: BorderRadius.circular(20),
          backgroundColor: MyColors.kSecondary,
          messageColor: MyColors.kPrimary,
          message: message,
          duration: Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.BOTTOM,
        )..show(context));
  }
}
