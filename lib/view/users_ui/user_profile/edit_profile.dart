import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view_model/update_user_profile_image_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/components/my_static_component .dart';
import 'full_screen_profile_pictre.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController mobileNumberTextController =
      TextEditingController(text: MySharedPrefencesSessionHandling.mobile_no);
  TextEditingController PasswordTextController =
      TextEditingController(text: MySharedPrefencesSessionHandling.token);
  TextEditingController nameTextControl =
      TextEditingController(text: MySharedPrefencesSessionHandling.name);
  TextEditingController emailTextController =
      TextEditingController(text: MySharedPrefencesSessionHandling.email);
  bool _showSpinner = false;

  File? image = null;
  final _picker = ImagePicker();

  @override
  void initState() {
    // MySharedPrefencesSessionHandling.getUserDataFromSharedPreferences();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updateUserProfileImageViewModel =
        Provider.of<UpdateUserProfileImageViewModel>(context);

    return ModalProgressHUD(
      inAsyncCall: updateUserProfileImageViewModel.loading,
      progressIndicator: Lottie.asset(
        "assets/lottie/loading.json",
        width: 100,
        fit: BoxFit.fill,
      ),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: MyColors.kPrimary,
            foregroundColor: MyColors.KWhite,
            title: Text("Edit Profile"),
            actions: [
              //   IconButton(
              //       onPressed: () async {
              //         // if (image != null) {
              //         //   Map<String, String> data = {
              //         //     '_method': "PUT",
              //         //   };
              //         //   print(("i m befor fucntion calling"));
              //         //   await updateUserProfileImageViewModel
              //         //       .getUpdateUserProfileImagedataFromRepository(
              //         //           data,
              //         //           image,
              //         //           MySharedPrefencesSessionHandling.userId,
              //         //           context);
              //         //   print(("i m after fucntion calling"));
              //         // } else {
              //         //   Utils.flushBarErrorMessage(
              //         //       "Image is not selected", context);
              //         // }
              //       },
              //       icon: Icon(
              //         Icons.save,
              //         size: 50,
              //       ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 10,
                      // width: MediaQuery.of(context).size.width / 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FullScreenProfilePicture(
                                    picturechanged:
                                        image != null ? true : false,
                                    pictureSrc: image != null
                                        ? image!.path
                                        : MySharedPrefencesSessionHandling
                                                    .user_image ==
                                                'no'
                                            ? "assets/images/pet.jpg"
                                            : MySharedPrefencesSessionHandling
                                                .user_image
                                                .toString(),
                                  )));
                        },
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: image != null
                              ? Image.file(
                                  File(image!.path).absolute,
                                  fit: BoxFit.cover,
                                ).image
                              : MySharedPrefencesSessionHandling.user_image ==
                                      'no'
                                  ? AssetImage('assets/images/pet.jpg')
                                  : Image.network(
                                          '${MySharedPrefencesSessionHandling.user_image}')
                                      .image,
                          child: Stack(children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
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
                                                            getImageFromCamera();
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

                                                            getImageFromGallery();
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
                                  // getImage();
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  // backgroundColor: MyColors.kSecondary,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: MyColors.kSecondary,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     'Change your Profile Picture',
                //     style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.bold,
                //       color: MyColors.kPrimary,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 0,
                ),

                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 1.55,
                    decoration: BoxDecoration(
                      color: MyColors.kSecondary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.kPrimary,
                          // blurRadius: 15,
                          // spreadRadius: 2,
                          // offset: Offset(
                          //   0,
                          //   5,
                          // ), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Login Text
                              Container(
                                child: Text(
                                  'Hey,\n  ${MySharedPrefencesSessionHandling.name}',
                                  // 'Hey,\n Muhammad Bilal!',
                                  style: TextStyle(
                                    color: MyColors.kPrimary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Name  Textfield
                              Container(
                                // color: Colors.red,
                                child: TextField(
                                  controller: nameTextControl,
                                  maxLength: 60,
                                  onTap: () {
                                    // if(nameTextControl.text.isEmpty){
                                    //   setState(() {
                                    //     nameTextControl.text==MySharedPrefencesSessionHandling.name;
                                    //   });
                                    // }
                                  },
                                  keyboardType: TextInputType.name,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  // ],
                                  style: TextStyle(
                                    color: MyColors.kBlack,
                                    // fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    // hintText: 'User',
                                    labelText: 'Name',
                                    labelStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    hintStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 180, 180, 180)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.kPrimary),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Icon(Icons.flag),
                                  ),
                                ),
                              ),

                              // Mobile number text field
                              Container(
                                // color: Colors.red,
                                child: TextField(
                                  controller: mobileNumberTextController,
                                  maxLength: 11,
                                  onTap: () {},
                                  keyboardType: TextInputType.number,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  // ],
                                  style: TextStyle(
                                    color: MyColors.kBlack,
                                    // fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '03XXXXXXXXX',
                                    labelText: 'Mobile Number',
                                    labelStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    hintStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 180, 180, 180)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.kPrimary),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Icon(Icons.flag),
                                  ),
                                ),
                              ),

                              // Email  Textfield
                              Container(
                                // color: Colors.red,
                                child: TextField(
                                  controller: emailTextController,
                                  maxLength: 60,
                                  onTap: () {},
                                  keyboardType: TextInputType.name,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  // ],
                                  style: TextStyle(
                                    color: MyColors.kBlack,
                                    // fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'example@gmail.com',
                                    labelText: 'Email',
                                    labelStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    hintStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 180, 180, 180)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.kPrimary),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),
                              ),

                              // Password TextField
                              Container(
                                // color: Colors.red,
                                child: TextField(
                                  controller: PasswordTextController,
                                  obscureText: true,
                                  onSubmitted: (value) => {},
                                  onTap: () {},
                                  style: TextStyle(
                                    color: MyColors.kBlack,
                                    // fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    hintStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 193, 198, 198),
                                        //Color.fromARGB(255, 115, 38, 38),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.kPrimary),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      // color:
                                      //     MyColors.kPrimary,
                                      // size: 25,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              RoundButton(
                                title: 'Update',
                                onpress: () async {
                                  if (nameTextControl.text.length < 1) {
                                    Utils.flushBarErrorMessage(
                                        "Name cannot be empty ", context);
                                  } else if (mobileNumberTextController
                                      .text.isEmpty) {
                                    Utils.flushBarErrorMessage(
                                        "Please Enter Phone Number", context);
                                  } else if (mobileNumberTextController
                                          .text.length <
                                      11) {
                                    Utils.flushBarErrorMessage(
                                        "Please Enter Full Phone Number",
                                        context);
                                  } else if (PasswordTextController
                                          .text.length ==
                                      0) {
                                    Utils.flushBarErrorMessage(
                                        "Please Enter Password", context);
                                  } else if (PasswordTextController
                                          .text.length <
                                      6) {
                                    Utils.flushBarErrorMessage(
                                        "Please Enter Minimum of 6 Characters",
                                        context);
                                  } else {
                                    // ///////////////////////////////

                                    // print("image Path : $image");
                                    // if (image == null) {
                                    //   Utils.flushBarErrorMessage(
                                    //       "Image is not selected", context);
                                    // } else {
                                    //   Map<String, String> data = {
                                    //     '_method': "PUT",
                                    //   };
                                    //   print("image Path : $image");
                                    //   print(
                                    //       ("i m befor fucntion calling in updating image"));
                                    //   await updateUserProfileImageViewModel
                                    //       .getUpdateUserProfileImagedataFromRepository(
                                    //           data,
                                    //           image,
                                    //           MySharedPrefencesSessionHandling
                                    //               .userId,
                                    //           context);
                                    //   // final prefs = await SharedPreferences.getInstance();
                                    //   // await prefs.setString('user_image', '${image.}');

                                    //   print(
                                    //       ("i m after fucntion calling after update image"));
                                    // }

                                    // //////////////////

                                    Map<String, String> data = {
                                      'name': nameTextControl.text,
                                      'mobile_no':
                                          mobileNumberTextController.text,
                                      'email': emailTextController.text,
                                      'token': PasswordTextController.text
                                    };
                                    await updateUserProfileImageViewModel
                                        .getUpdateUserProfileInfodataFromRepository(
                                            data,
                                            MySharedPrefencesSessionHandling
                                                .userId,
                                            context);
                                    MySharedPrefencesSessionHandling
                                        .updateUserDataInSharedPreferences(
                                            nameTextControl.text,
                                            mobileNumberTextController.text,
                                            emailTextController.text,
                                            PasswordTextController.text);
                                    if (kDebugMode) {
                                      print(
                                          ("i m after updating user daata calling"));
                                    }
                                  }
                                },
                                width: 140,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                )
              ],
            ),
          )),
    );
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      //print(image!.path);
      setState(() {});
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      //print(image!.path);
      setState(() {});
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }

  Future updateUserProfileImage() async {
    final updateUserProfileImageViewModel =
        Provider.of<UpdateUserProfileImageViewModel>(context);
    if (image != null) {
      Map<String, String> data = {
        '_method': "PUT",
      };
      await updateUserProfileImageViewModel
          .getUpdateUserProfileImagedataFromRepository(
              data, image, MySharedPrefencesSessionHandling.userId, context);
    } else {
      Utils.flushBarErrorMessage("Image is not selected", context);
    }
  }

  // _update() async {
  //   final updateUserProfileImageViewModel =
  //       Provider.of<UpdateUserProfileImageViewModel>(context, listen: false);
  //   if (nameTextControl.text.length < 1) {
  //     Utils.flushBarErrorMessage("Name cannot be empty ", context);
  //   } else if (mobileNumberTextController.text.isEmpty) {
  //     Utils.flushBarErrorMessage("Please Enter Phone Number", context);
  //   } else if (mobileNumberTextController.text.length < 11) {
  //     Utils.flushBarErrorMessage("Please Enter Full Phone Number", context);
  //   } else if (PasswordTextController.text.length == 0) {
  //     Utils.flushBarErrorMessage("Please Enter Password", context);
  //   } else if (PasswordTextController.text.length < 6) {
  //     Utils.flushBarErrorMessage(
  //         "Please Enter Minimum of 6 Characters", context);
  //   } else {
  //     // ///////////////////////////////
  //     // if (image != null) {
  //     //   Map<String, String> data = {
  //     //     '_method': "PUT",
  //     //   };
  //     //   print(("i m befor fucntion calling"));
  //     //   await updateUserProfileImageViewModel
  //     //       .getUpdateUserProfileImagedataFromRepository(
  //     //           data,
  //     //           image,
  //     //           MySharedPrefencesSessionHandling
  //     //               .userId,
  //     //           context);
  //     //   // final prefs = await SharedPreferences.getInstance();
  //     //   // await prefs.setString('user_image', '${image.}');

  //     //   print(("i m after fucntion calling"));
  //     // } else {
  //     //   Utils.flushBarErrorMessage(
  //     //       "Image is not selected", context);
  //     // }
  //     // //////////////////

  //     Map<String, String> data = {
  //       'name': nameTextControl.text,
  //       'mobile_no': mobileNumberTextController.text,
  //       'email': emailTextController.text,
  //       'token': PasswordTextController.text
  //     };
  //     await updateUserProfileImageViewModel
  //         .getUpdateUserProfileInfodataFromRepository(
  //             data, MySharedPrefencesSessionHandling.userId, context);
  //     MySharedPrefencesSessionHandling.updateUserDataInSharedPreferences(
  //         nameTextControl.text,
  //         mobileNumberTextController.text,
  //         emailTextController.text,
  //         PasswordTextController.text);
  //     if (kDebugMode) {
  //       print(("i m after updating user daata calling"));
  //     }
  //   }
  // }

}



// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
// import 'package:mvvm_practice_app/res/components/round_button.dart';
// import 'package:mvvm_practice_app/res/my_app_colors.dart';
// import 'package:http/http.dart' as http;
// import 'package:mvvm_practice_app/utils/utils.dart';
// import 'package:mvvm_practice_app/view_model/update_user_profile_image_view_model.dart';
// import 'package:provider/provider.dart';

// import '../../../res/components/my_static_component .dart';
// import 'full_screen_profile_pictre.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   TextEditingController mobileNumberTextController = TextEditingController();
//   TextEditingController PasswordTextController = TextEditingController();
//   TextEditingController nameTextControl = TextEditingController();
//   TextEditingController emailTextController = TextEditingController();
//   bool _showSpinner = false;

//   File? image = null;
//   final _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     final updateUserProfileImageViewModel =
//         Provider.of<UpdateUserProfileImageViewModel>(context);

//     return ModalProgressHUD(
//       inAsyncCall: updateUserProfileImageViewModel.loading,
//       progressIndicator: Lottie.asset(
//         "assets/lottie/loading.json",
//         width: 100,
//         fit: BoxFit.fill,
//       ),
//       child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: MyColors.kPrimary,
//             foregroundColor: MyColors.KWhite,
//             title: Text("Edit Profile"),
//             actions: [
//               IconButton(
//                   onPressed: () async {
//                     if (image != null) {
//                       Map<String, String> data = {
//                         '_method': "PUT",
//                       };
//                       print(("i m befor fucntion calling"));
//                       await updateUserProfileImageViewModel
//                           .getUpdateUserProfileImagedataFromRepository(
//                               data,
//                               image,
//                               MySharedPrefencesSessionHandling.userId,
//                               context);
//                       print(("i m after fucntion calling"));
//                     } else {
//                       Utils.flushBarErrorMessage(
//                           "Image is not selected", context);
//                     }
//                   },
//                   icon: Icon(
//                     Icons.save,
//                     size: 50,
//                   ))
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Profile Image
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       // height: MediaQuery.of(context).size.height / 10,
//                       // width: MediaQuery.of(context).size.width / 1,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => FullScreenProfilePicture(
//                                     picturechanged:
//                                         image != null ? true : false,
//                                     pictureSrc: image != null
//                                         ? image!.path
//                                         : "assets/images/pet.jpg",
//                                   )));
//                         },
//                         child: CircleAvatar(
//                           radius: 100,
//                           backgroundImage: image != null
//                               ? Image.file(
//                                   File(image!.path).absolute,
//                                   fit: BoxFit.cover,
//                                 ).image
//                               : AssetImage('assets/images/pet.jpg'),
//                           child: Stack(children: [
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   showModalBottomSheet(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.vertical(
//                                               top: Radius.circular(25))),
//                                       context: context,
//                                       builder: (context) => Container(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height /
//                                                 10,
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 80),
//                                               child: Row(
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       IconButton(
//                                                           onPressed: () async {
//                                                             Navigator.pop(
//                                                                 context);
//                                                             getImageFromCamera();
//                                                             // print(
//                                                             //     "i am after image selctig");
//                                                             // update user profile image

//                                                             // Future.delayed(
//                                                             //     Duration(
//                                                             //         seconds: 4),
//                                                             //     () async {
//                                                             //   print(
//                                                             //       "print statement after 4 sec");
//                                                             // });
//                                                           },
//                                                           icon: Icon(
//                                                             Icons.camera_alt,
//                                                             color: MyColors
//                                                                 .kPrimary,
//                                                           )),
//                                                       Text(
//                                                         "Camera",
//                                                         style: TextStyle(
//                                                             color: MyColors
//                                                                 .kPrimary,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   Spacer(),
//                                                   Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       IconButton(
//                                                           onPressed: () async {
//                                                             Navigator.pop(
//                                                                 context);

//                                                             getImageFromGallery();
//                                                             // await updateUserProfileImage();
//                                                           },
//                                                           icon: Icon(
//                                                             Icons.photo,
//                                                             color: MyColors
//                                                                 .kPrimary,
//                                                           )),
//                                                       Text(
//                                                         "Gallery",
//                                                         style: TextStyle(
//                                                             color: MyColors
//                                                                 .kPrimary,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold),
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ));
//                                   // getImage();
//                                 },
//                                 child: CircleAvatar(
//                                   radius: 25,
//                                   // backgroundColor: MyColors.kSecondary,
//                                   child: Icon(
//                                     Icons.camera_alt,
//                                     color: MyColors.kSecondary,
//                                     size: 30,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(8.0),
//                 //   child: Text(
//                 //     'Change your Profile Picture',
//                 //     style: TextStyle(
//                 //       fontSize: 12,
//                 //       fontWeight: FontWeight.bold,
//                 //       color: MyColors.kPrimary,
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 0,
//                 ),

//                 Center(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     height: MediaQuery.of(context).size.height / 2,
//                     decoration: BoxDecoration(
//                       color: MyColors.kSecondary,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: MyColors.kPrimary,
//                           // blurRadius: 15,
//                           // spreadRadius: 2,
//                           // offset: Offset(
//                           //   0,
//                           //   5,
//                           // ), // Shadow position
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Center(
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // Login Text
//                               Container(
//                                 child: Text(
//                                   'Hey,\n Muhammad Bilal!',
//                                   style: TextStyle(
//                                     color: MyColors.kPrimary,
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               // Name  Textfield
//                               Container(
//                                 // color: Colors.red,
//                                 child: TextField(
//                                   controller: nameTextControl,
//                                   maxLength: 60,
//                                   onTap: () {},
//                                   keyboardType: TextInputType.name,
//                                   // inputFormatters: [
//                                   //   FilteringTextInputFormatter.digitsOnly,
//                                   // ],
//                                   style: TextStyle(
//                                     color: MyColors.kBlack,
//                                     // fontSize: 18,
//                                   ),
//                                   decoration: InputDecoration(
//                                     // hintText: 'User',
//                                     labelText: 'Name',
//                                     labelStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     hintStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     enabledBorder: new OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(
//                                           color: Color.fromARGB(
//                                               255, 180, 180, 180)),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: MyColors.kPrimary),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     prefixIcon: Icon(Icons.flag),
//                                   ),
//                                 ),
//                               ),
// // Mobile number text field
//                               Container(
//                                 // color: Colors.red,
//                                 child: TextField(
//                                   controller: mobileNumberTextController,
//                                   maxLength: 11,
//                                   onTap: () {},
//                                   keyboardType: TextInputType.number,
//                                   // inputFormatters: [
//                                   //   FilteringTextInputFormatter.digitsOnly,
//                                   // ],
//                                   style: TextStyle(
//                                     color: MyColors.kBlack,
//                                     // fontSize: 18,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: '03XXXXXXXXX',
//                                     labelText: 'Mobile Number',
//                                     labelStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     hintStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     enabledBorder: new OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(
//                                           color: Color.fromARGB(
//                                               255, 180, 180, 180)),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: MyColors.kPrimary),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     prefixIcon: Icon(Icons.flag),
//                                   ),
//                                 ),
//                               ),
// // email texfield
//                               Container(
//                                 // color: Colors.red,
//                                 child: TextField(
//                                   controller: emailTextController,
//                                   maxLength: 60,
//                                   onTap: () {},
//                                   keyboardType: TextInputType.name,
//                                   // inputFormatters: [
//                                   //   FilteringTextInputFormatter.digitsOnly,
//                                   // ],
//                                   style: TextStyle(
//                                     color: MyColors.kBlack,
//                                     // fontSize: 18,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'example@gmail.com',
//                                     labelText: 'Email',
//                                     labelStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     hintStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     enabledBorder: new OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(
//                                           color: Color.fromARGB(
//                                               255, 180, 180, 180)),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: MyColors.kPrimary),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     prefixIcon: Icon(Icons.email_outlined),
//                                   ),
//                                 ),
//                               ),

// // Password TextField
//                               Container(
//                                 // color: Colors.red,
//                                 child: TextField(
//                                   controller: PasswordTextController,
//                                   obscureText: true,
//                                   onTap: () {},
//                                   style: TextStyle(
//                                     color: MyColors.kBlack,
//                                     // fontSize: 18,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'Password',
//                                     labelText: 'Password',
//                                     labelStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     hintStyle:
//                                         TextStyle(color: MyColors.kPrimary),
//                                     enabledBorder: new OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 193, 198, 198),
//                                         //Color.fromARGB(255, 115, 38, 38),
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: MyColors.kPrimary),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     prefixIcon: Icon(
//                                       Icons.lock,
//                                       // color:
//                                       //     MyColors.kPrimary,
//                                       // size: 25,
//                                     ),
//                                   ),
//                                 ),
//                               ),

//                               SizedBox(
//                                 height: 30,
//                               ),
//                               RoundButton(
//                                 title: 'Update',
//                                 onpress: () {
//                                   // GetUserByIdModel();
//                                   // nameTextControl.text.length < 1
//                                   //     ? Utils.flushBarErrorMessage(
//                                   //         "Name cannot be empty ", context)
//                                   //     : mobileNumberTextController
//                                   //             .text.isEmpty
//                                   //         ? Utils.flushBarErrorMessage(
//                                   //             "Please Enter Phone Number", context)
//                                   //         : mobileNumberTextController
//                                   //                     .text.length <
//                                   //                 11
//                                   //             ? Utils.flushBarErrorMessage(
//                                   //                 "Please Enter Full Phone Number", context)
//                                   //             : PasswordTextController
//                                   //                         .text.length ==
//                                   //                     0
//                                   //                 ? Utils.flushBarErrorMessage(
//                                   //                     "Please Enter Password",
//                                   //                     context)
//                                   //                 : PasswordTextController
//                                   //                             .text
//                                   //                             .length <
//                                   //                         6
//                                   //                     ? Utils.flushBarErrorMessage(
//                                   //                         "Please Enter Minimum of 6 Characters",
//                                   //                         context)
//                                   //                     :
//                                   ///////////////////

//                                   Map<String, String> data = {
//                                     'name': nameTextControl.text,
//                                     'mobile_no':
//                                         mobileNumberTextController.text,
//                                     'email': emailTextController.text,
//                                     'token': PasswordTextController.text
//                                   };

//                                   // authViewModel.SignUpApi(
//                                   //     data, context);

//                                   //                         //////////////////

//                                   // SignUP(
//                                   //     nameTextControl.text,
//                                   //     mobileNumberTextController.text,
//                                   //     PasswordTextController.text);
//                                 },
//                                 width: 140,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   Future getImageFromCamera() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       //print(image!.path);
//       setState(() {});
//     } else {
//       if (kDebugMode) {
//         print('no image selected');
//       }
//     }
//   }

//   Future getImageFromGallery() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       //print(image!.path);
//       setState(() {});
//     } else {
//       if (kDebugMode) {
//         print('no image selected');
//       }
//     }
//   }

//   Future updateUserProfileImage() async {
//     final updateUserProfileImageViewModel =
//         Provider.of<UpdateUserProfileImageViewModel>(context);
//     if (image != null) {
//       Map<String, String> data = {
//         '_method': "PUT",
//       };
//       await updateUserProfileImageViewModel
//           .getUpdateUserProfileImagedataFromRepository(
//               data, image, MySharedPrefencesSessionHandling.userId, context);
//     } else {
//       Utils.flushBarErrorMessage("Image is not selected", context);
//     }
//   }
// }
