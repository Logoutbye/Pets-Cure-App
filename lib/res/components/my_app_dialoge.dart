import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStaticComponents {
  static myAppDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(''),
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
  