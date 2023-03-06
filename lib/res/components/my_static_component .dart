import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

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
  