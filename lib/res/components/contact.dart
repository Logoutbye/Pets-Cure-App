import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                    onPressed: () {
                      _openWhatsApp(whatsapp_no);
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
                    onPressed: () {
                      _openPhoneDialer(phone_no);
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
