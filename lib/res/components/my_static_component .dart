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

  static String? token = "";

  static void sessionHandling() async {
    // shared prefrences sesson handling
    final prefs = await SharedPreferences.getInstance();
    userId = await prefs.getInt('userId') ?? 0;
    isUserLogedIn = prefs.getBool('isLogedIn') ?? false;
  }

  static int useridd = 0;

  // storing data{name,images etc} of loggedin user
  static void setUserDataInSharedPreferences(
      var namepassed,
      var mobile_no_passed,
      var email_passed,
      var user_image_passed,
      var user_token_passed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', '$namepassed');
    await prefs.setString('mobile_no', '$mobile_no_passed');
    await prefs.setString('email', '$email_passed');
    await prefs.setString('token', '$user_token_passed');
    await prefs.setString('user_image', '$user_image_passed');
    name = namepassed;

<<<<<<< HEAD
    mobile_no = mobile_no_passed;
    email = email_passed;

    user_image = user_image_passed;
    token = user_token_passed;
  }

=======
>>>>>>> 0368a40a7628edcac8722ca58630132c615dac9a
  static getUserDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    mobile_no = prefs.getString('mobile_no');
    email = prefs.getString('email');
    user_image = prefs.getString('user_image');
<<<<<<< HEAD
    token = prefs.getString('token');
  }

  static removeUserDataFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('mobile_no');
    await prefs.remove('email');
    await prefs.remove('user_image');
    await prefs.remove('token');
=======
>>>>>>> 0368a40a7628edcac8722ca58630132c615dac9a
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
  