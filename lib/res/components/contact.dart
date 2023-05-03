import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_app_colors.dart';

class ContactBottomModel extends StatelessWidget {
  final String buttonOneTitle;
  final String whatsapp_no;
  final String buttonTwoTitle;
  final String phone_no;

  const ContactBottomModel(
      {Key? key,
      required this.buttonOneTitle,
      required this.buttonTwoTitle,
      required this.phone_no,
      required this.whatsapp_no})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      // Request permission to access external storage
                      var status = await Permission.storage.request();

                      if (status.isGranted) {
                        
                        _openWhatsApp(whatsapp_no);
                        print(
                            'Permission granted, you can now make phone calls');
                      } else if (status.isDenied) {
                        // If the user denied the permission, show a dialog box
                        // with a button to open the app settings and allow the user
                        // to grant the permission manually.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Permission denied'),
                              content: Text(
                                  'Please allow access to make phone calls in App Settings to use this feature.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Permission.storage.request();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (status.isPermanentlyDenied) {
                        // If the user denied the permission permanently, show a dialog box
                        // with a button to open the app settings and allow the user
                        // to grant the permission manually.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Permission permanently denied'),
                              content: Text(
                                  'Please allow access to make phone calls in App Settings to use this feature.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    openAppSettings();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    icon: Icon(
                      Icons.whatsapp,
                      color: MyColors.kPrimary,
                    )),
                Text(
                  buttonOneTitle,
                  style: TextStyle(
                      color: MyColors.kPrimary, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
// Request permission to access external storage
                      var status = await Permission.storage.request();

                      if (status.isGranted) {
                        _openPhoneDialer(phone_no);

                        print(
                            'Permission granted, you can now make phone calls');
                      } else if (status.isDenied) {
                        // If the user denied the permission, show a dialog box
                        // with a button to open the app settings and allow the user
                        // to grant the permission manually.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Permission denied'),
                              content: Text(
                                  'Please allow access to make phone calls in App Settings to use this feature.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Permission.storage.request();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (status.isPermanentlyDenied) {
                        // If the user denied the permission permanently, show a dialog box
                        // with a button to open the app settings and allow the user
                        // to grant the permission manually.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Permission permanently denied'),
                              content: Text(
                                  'Please allow access to make phone calls in App Settings to use this feature.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    openAppSettings();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }

                      //////////////////////////
                    },
                    icon: Icon(
                      Icons.call,
                      color: MyColors.kPrimary,
                    )),
                Text(
                  buttonTwoTitle,
                  style: TextStyle(
                      color: MyColors.kPrimary, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );

    //    Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       ElevatedButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //           // Do something when the first button is pressed
    //         },
    //         child: Text(titleButtonOne),
    //       ),
    //       SizedBox(height: 16),
    //       ElevatedButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //           // Do something when the second button is pressed
    //         },
    //         child: Text('Button 2'),
    //       ),
    //     ],
    //   ),
    // );
  }

  void _openWhatsApp(String phoneNumber) async {
    String url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openPhoneDialer(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
