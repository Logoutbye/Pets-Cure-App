import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../my_app_colors.dart';

class Contact extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  final double width;
  Contact(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onpress,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
            showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25))),
                                      context: context,
                                      builder: (context) => Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 80),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context);
                                                            // getImageFromCamera();
                                                            // print(
                                                            //     "i am after image selctig");
                                                            // update user profile image

                                                            // Future.delayed(
                                                            //     Duration(
                                                            //         seconds: 4),
                                                            //     () async {
                                                            //   print(
                                                            //       "print statement after 4 sec");
                                                            // });
                                                          },
                                                          icon: Icon(
                                                            Icons.camera_alt,
                                                            color: MyColors
                                                                .kPrimary,
                                                          )),
                                                      Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            color: MyColors
                                                                .kPrimary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context);

                                                            // getImageFromGallery();
                                                            // await updateUserProfileImage();
                                                          },
                                                          icon: Icon(
                                                            Icons.photo,
                                                            color: MyColors
                                                                .kPrimary,
                                                          )),
                                                      Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            color: MyColors
                                                                .kPrimary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ));
                               
    }, child: Container());
  }
}
