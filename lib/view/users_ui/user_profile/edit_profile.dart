import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:http/http.dart' as http;

import 'full_screen_profile_pictre.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController PasswordTextController = TextEditingController();
  TextEditingController nameTextControl = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool _showSpinner = false;

  File? image = null;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
        title: Text("Edit Profile"),
      ),
      body:  SingleChildScrollView(
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
                                  picturechanged: image != null ? true : false,
                                  pictureSrc: image != null
                                      ? image!.path
                                      : "assets/images/pet.jpg",
                                )));
                      },
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: image != null
                            ? Image.file(
                                File(image!.path).absolute,
                                fit: BoxFit.cover,
                              ).image
                            : AssetImage('assets/images/pet.jpg'),
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
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  7,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 80),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                          getImageFromCamera();
                                                        },
                                                        icon: Icon(
                                                          Icons.camera_alt,
                                                          color:
                                                              MyColors.kPrimary,
                                                        )),
                                                    Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.kPrimary,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
            
                                                          getImageFromGallery();
                                                        },
                                                        icon: Icon(
                                                          Icons.photo,
                                                          color:
                                                              MyColors.kPrimary,
                                                        )),
                                                    Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.kPrimary,
                                                          fontWeight:
                                                              FontWeight.bold),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Change your Profile Picture',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: MyColors.kPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
            
              Positioned(
                top: MediaQuery.of(context).size.height / 3.8,
                left: MediaQuery.of(context).size.height / 24,
            
                // Main form Container
                child: Center(
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
                                  'Hey,\n Muhammad Bilal!',
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
                                    // hintText: 'User',
                                    labelText: 'Name',
                                    labelStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    hintStyle:
                                        TextStyle(color: MyColors.kPrimary),
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 180, 180, 180)),
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
                                          color:
                                              Color.fromARGB(255, 180, 180, 180)),
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
                                          color:
                                              Color.fromARGB(255, 180, 180, 180)),
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
                                        color: Color.fromARGB(255, 193, 198, 198),
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
                                onpress: () {
            
                                  // GetUserByIdModel();
                                  // nameTextControl.text.length < 1
                                  //     ? Utils.flushBarErrorMessage(
                                  //         "Name cannot be empty ", context)
                                  //     : mobileNumberTextController
                                  //             .text.isEmpty
                                  //         ? Utils.flushBarErrorMessage(
                                  //             "Please Enter Phone Number", context)
                                  //         : mobileNumberTextController
                                  //                     .text.length <
                                  //                 11
                                  //             ? Utils.flushBarErrorMessage(
                                  //                 "Please Enter Full Phone Number", context)
                                  //             : PasswordTextController
                                  //                         .text.length ==
                                  //                     0
                                  //                 ? Utils.flushBarErrorMessage(
                                  //                     "Please Enter Password",
                                  //                     context)
                                  //                 : PasswordTextController
                                  //                             .text
                                  //                             .length <
                                  //                         6
                                  //                     ? Utils.flushBarErrorMessage(
                                  //                         "Please Enter Minimum of 6 Characters",
                                  //                         context)
                                  //                     :
                                  ///////////////////
            
                                  Map data = {
                                    'name': nameTextControl.text,
                                    'mobile_no': mobileNumberTextController.text,
                                    'email': emailTextController.text,
                                    'token': PasswordTextController.text
                                  };
            
                                  // authViewModel.SignUpApi(
                                  //     data, context);
            
                    //                         //////////////////
            
                                  // SignUP(
                                  //     nameTextControl.text,
                                  //     mobileNumberTextController.text,
                                  //     PasswordTextController.text);
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
              ),
                      ],
                    ),
            )
        
        // child: Column(
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Profile Image
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           // height: MediaQuery.of(context).size.height / 10,
        //           // width: MediaQuery.of(context).size.width / 1,
        //           child: GestureDetector(
        //             onTap: () {
        //               Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => FullScreenProfilePicture(
        //                         picturechanged: image != null ? true : false,
        //                         pictureSrc: image != null
        //                             ? image!.path
        //                             : "assets/images/pet.jpg",
        //                       )));
        //             },
        //             child: CircleAvatar(
        //               radius: 100,
        //               backgroundImage: image != null
        //                   ? Image.file(
        //                       File(image!.path).absolute,
        //                       fit: BoxFit.cover,
        //                     ).image
        //                   : AssetImage('assets/images/pet.jpg'),
        //               child: Stack(children: [
        //                 Align(
        //                   alignment: Alignment.bottomRight,
        //                   child: GestureDetector(
        //                     onTap: () {
        //                       showModalBottomSheet(
        //                           shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.vertical(
        //                                   top: Radius.circular(25))),
        //                           context: context,
        //                           builder: (context) => Container(
        //                                 height:
        //                                     MediaQuery.of(context).size.height /
        //                                         7,
        //                                 child: Padding(
        //                                   padding: const EdgeInsets.symmetric(
        //                                       horizontal: 80),
        //                                   child: Row(
        //                                     children: [
        //                                       Column(
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.center,
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.center,
        //                                         children: [
        //                                           IconButton(
        //                                               onPressed: () {
        //                                                 Navigator.pop(context);
        //                                                 getImageFromCamera();
        //                                               },
        //                                               icon: Icon(
        //                                                 Icons.camera_alt,
        //                                                 color:
        //                                                     MyColors.kPrimary,
        //                                               )),
        //                                           Text(
        //                                             "Camera",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     MyColors.kPrimary,
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           )
        //                                         ],
        //                                       ),
        //                                       Spacer(),
        //                                       Column(
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.center,
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.center,
        //                                         children: [
        //                                           IconButton(
        //                                               onPressed: () {
        //                                                 Navigator.pop(context);
        //                                                 getImageFromGallery();
        //                                               },
        //                                               icon: Icon(
        //                                                 Icons.photo,
        //                                                 color:
        //                                                     MyColors.kPrimary,
        //                                               )),
        //                                           Text(
        //                                             "Gallery",
        //                                             style: TextStyle(
        //                                                 color:
        //                                                     MyColors.kPrimary,
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           )
        //                                         ],
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ));
        //                       // getImage();
        //                     },
        //                     child: CircleAvatar(
        //                       radius: 25,
        //                       // backgroundColor: MyColors.kSecondary,
        //                       child: Icon(
        //                         Icons.camera_alt,
        //                         color: MyColors.kSecondary,
        //                         size: 30,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ]),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         'Change your Profile Picture',
        //         style: TextStyle(
        //           fontSize: 12,
        //           fontWeight: FontWeight.bold,
        //           color: MyColors.kPrimary,
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 22,
        //     ),
        //     Positioned(
        //       top: MediaQuery.of(context).size.height / 3.8,
        //       left: MediaQuery.of(context).size.height / 24,
        //       // Main form Container
        //       child: Center(
        //         child: Container(
        //           width: MediaQuery.of(context).size.width / 1.2,
        //           height: MediaQuery.of(context).size.height / 1.55,
        //           decoration: BoxDecoration(
        //             color: MyColors.kSecondary,
        //             borderRadius: BorderRadius.circular(20),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: MyColors.kPrimary,
        //                 // blurRadius: 15,
        //                 // spreadRadius: 2,
        //                 // offset: Offset(
        //                 //   0,
        //                 //   5,
        //                 // ), // Shadow position
        //               ),
        //             ],
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(10),
        //             child: Center(
        //               child: SingleChildScrollView(
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     // Login Text
        //                     Container(
        //                       child: Text(
        //                         'Hey,\n Muhammad Bilal!',
        //                         style: TextStyle(
        //                           color: MyColors.kPrimary,
        //                           fontSize: 22,
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 20,
        //                     ),
        //                     // Name  Textfield
        //                     Container(
        //                       // color: Colors.red,
        //                       child: TextField(
        //                         controller: nameTextControl,
        //                         maxLength: 60,
        //                         onTap: () {},
        //                         keyboardType: TextInputType.name,
        //                         // inputFormatters: [
        //                         //   FilteringTextInputFormatter.digitsOnly,
        //                         // ],
        //                         style: TextStyle(
        //                           color: MyColors.kBlack,
        //                           // fontSize: 18,
        //                         ),
        //                         decoration: InputDecoration(
        //                           // hintText: 'User',
        //                           labelText: 'Name',
        //                           labelStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           hintStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           enabledBorder: new OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(10),
        //                             borderSide: BorderSide(
        //                                 color:
        //                                     Color.fromARGB(255, 180, 180, 180)),
        //                           ),
        //                           focusedBorder: OutlineInputBorder(
        //                             borderSide:
        //                                 BorderSide(color: MyColors.kPrimary),
        //                             borderRadius: BorderRadius.circular(10),
        //                           ),
        //                           prefixIcon: Icon(Icons.flag),
        //                         ),
        //                       ),
        //                     ),
        //                     // Mobile number text field
        //                     Container(
        //                       // color: Colors.red,
        //                       child: TextField(
        //                         controller: mobileNumberTextController,
        //                         maxLength: 11,
        //                         onTap: () {},
        //                         keyboardType: TextInputType.number,
        //                         // inputFormatters: [
        //                         //   FilteringTextInputFormatter.digitsOnly,
        //                         // ],
        //                         style: TextStyle(
        //                           color: MyColors.kBlack,
        //                           // fontSize: 18,
        //                         ),
        //                         decoration: InputDecoration(
        //                           hintText: '03XXXXXXXXX',
        //                           labelText: 'Mobile Number',
        //                           labelStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           hintStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           enabledBorder: new OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(10),
        //                             borderSide: BorderSide(
        //                                 color:
        //                                     Color.fromARGB(255, 180, 180, 180)),
        //                           ),
        //                           focusedBorder: OutlineInputBorder(
        //                             borderSide:
        //                                 BorderSide(color: MyColors.kPrimary),
        //                             borderRadius: BorderRadius.circular(10),
        //                           ),
        //                           prefixIcon: Icon(Icons.flag),
        //                         ),
        //                       ),
        //                     ),
        //                     // Email  Textfield
        //                     Container(
        //                       // color: Colors.red,
        //                       child: TextField(
        //                         controller: emailTextController,
        //                         maxLength: 60,
        //                         onTap: () {},
        //                         keyboardType: TextInputType.name,
        //                         // inputFormatters: [
        //                         //   FilteringTextInputFormatter.digitsOnly,
        //                         // ],
        //                         style: TextStyle(
        //                           color: MyColors.kBlack,
        //                           // fontSize: 18,
        //                         ),
        //                         decoration: InputDecoration(
        //                           hintText: 'example@gmail.com',
        //                           labelText: 'Email',
        //                           labelStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           hintStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           enabledBorder: new OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(10),
        //                             borderSide: BorderSide(
        //                                 color:
        //                                     Color.fromARGB(255, 180, 180, 180)),
        //                           ),
        //                           focusedBorder: OutlineInputBorder(
        //                             borderSide:
        //                                 BorderSide(color: MyColors.kPrimary),
        //                             borderRadius: BorderRadius.circular(10),
        //                           ),
        //                           prefixIcon: Icon(Icons.email_outlined),
        //                         ),
        //                       ),
        //                     ),
        //                     // Password TextField
        //                     Container(
        //                       // color: Colors.red,
        //                       child: TextField(
        //                         controller: PasswordTextController,
        //                         obscureText: true,
        //                         onTap: () {},
        //                         style: TextStyle(
        //                           color: MyColors.kBlack,
        //                           // fontSize: 18,
        //                         ),
        //                         decoration: InputDecoration(
        //                           hintText: 'Password',
        //                           labelText: 'Password',
        //                           labelStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           hintStyle:
        //                               TextStyle(color: MyColors.kPrimary),
        //                           enabledBorder: new OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(10),
        //                             borderSide: BorderSide(
        //                               color: Color.fromARGB(255, 193, 198, 198),
        //                               //Color.fromARGB(255, 115, 38, 38),
        //                             ),
        //                           ),
        //                           focusedBorder: OutlineInputBorder(
        //                             borderSide:
        //                                 BorderSide(color: MyColors.kPrimary),
        //                             borderRadius: BorderRadius.circular(10),
        //                           ),
        //                           prefixIcon: Icon(
        //                             Icons.lock,
        //                             // color:
        //                             //     MyColors.kPrimary,
        //                             // size: 25,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 30,
        //                     ),
        //                     RoundButton(
        //                       title: 'Update',
        //                       onpress: () {
        //                         GetUserByIdModel();
        //                         // nameTextControl.text.length < 1
        //                         //     ? Utils.flushBarErrorMessage(
        //                         //         "Name cannot be empty ", context)
        //                         //     : mobileNumberTextController
        //                         //             .text.isEmpty
        //                         //         ? Utils.flushBarErrorMessage(
        //                         //             "Please Enter Phone Number", context)
        //                         //         : mobileNumberTextController
        //                         //                     .text.length <
        //                         //                 11
        //                         //             ? Utils.flushBarErrorMessage(
        //                         //                 "Please Enter Full Phone Number", context)
        //                         //             : PasswordTextController
        //                         //                         .text.length ==
        //                         //                     0
        //                         //                 ? Utils.flushBarErrorMessage(
        //                         //                     "Please Enter Password",
        //                         //                     context)
        //                         //                 : PasswordTextController
        //                         //                             .text
        //                         //                             .length <
        //                         //                         6
        //                         //                     ? Utils.flushBarErrorMessage(
        //                         //                         "Please Enter Minimum of 6 Characters",
        //                         //                         context)
        //                         //                     :
        //                         ///////////////////
        //                         Map data = {
        //                           'name': nameTextControl.text,
        //                           'mobile_no': mobileNumberTextController.text,
        //                           'email': emailTextController.text,
        //                           'token': PasswordTextController.text
        //                         };
        //                         // authViewModel.SignUpApi(
        //                         //     data, context);
        //                         //////////////////
        //                         // SignUP(
        //                         //     nameTextControl.text,
        //                         //     mobileNumberTextController.text,
        //                         //     PasswordTextController.text);
        //                       },
        //                       width: 140,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      
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
      print('no image selected');
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
      print('no image selected');
    }
  }

 
}
