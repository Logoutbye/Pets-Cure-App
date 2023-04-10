import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyStaticComponents {
  static myAppDialogBox(BuildContext context, String title, String content) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: MyColors.kSecondary,
            title: Center(child: Text(title.toString())),
            content: SelectableText(
              content.toString(),
              showCursor: true,
              textAlign: TextAlign.center,
              //toolbarOptions:
              // ToolbarOptions(copy: true),
            ),
            //actionsAlignment: MainAxisAlignment.center,

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text(
                    'Cancel',
                    //style: TextStyle(color: MyColors.kSecondary),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class MySharedPrefencesSessionHandling {
  // shared preferences variables for session handling
  static bool isUserLogedIn = false;
  static int userId = 0;

  static String? name = "";
  static String? mobile_no = "";
  static String? email = '';
  static String? user_image = '';

  static String navigateToPage = "HomeScreen";

  static void sessionHandling() async {
    // shared prefrences sesson handling
    final prefs = await SharedPreferences.getInstance();
    userId = await prefs.getInt('userId') ?? 0;
    isUserLogedIn = prefs.getBool('isLogedIn') ?? false;
  }

  static int useridd = 0;

  // storing data{name,images etc} of loggedin user
  // static void storingUserDataInSharedPreferences(
  //     var name, var mobile_no, var email, var user_image) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('name', '$name');
  //   await prefs.setString('mobile_no', '$mobile_no');
  //   await prefs.setString('email', '$email');
  //   // await prefs.setString('token', '$token');
  //   await prefs.setString('user_image', '$user_image');
  // }

  static  getUserDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
     mobile_no = prefs.getString('mobile_no');
    email = prefs.getString('email');
     user_image = prefs.getString('user_image');
  }
}



    //showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text("Delete"),
    //         content: Text("Are You Sure?"),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 //Navigator.pop(context);
    //               },
    //               child: Text("No", style: TextStyle(color: AppColors.kBlack))),
    //           TextButton(
    //               onPressed: () {
    //                 deleteTask(data[index]);
    //                 if (data.length < 0) {
    //                   provider.updateHasData(box.isEmpty);
    //                 } else {
    //                   provider.updateHasData(box.isNotEmpty);
    //                 }

    //                 Navigator.pop(context);
    //               },
    //               child: Text("Yes", style: TextStyle(color: AppColors.kBlack)))
    //         ],
    //       );
    //     }
    //     );
  