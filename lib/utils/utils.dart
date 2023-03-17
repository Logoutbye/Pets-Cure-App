import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

class Utils {
  static void fieldfocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  // flutter toast message
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  // flutter flushbar
  static flushBarErrorMessage(String message, BuildContext context) {
    
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          
          backgroundColor: MyColors.kPrimary,
          message: message,
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
        )..show(context));
  }
}
