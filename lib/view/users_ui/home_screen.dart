//import 'dart:js_util';

//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/PetsMarket.dart';
import 'package:mvvm_practice_app/view/registration/pets_registration.dart';
import 'package:mvvm_practice_app/view/users_ui/all_doctors.dart';
import 'package:mvvm_practice_app/view/users_ui/all_hospitals.dart';

//import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.KWhite,
      appBar: AppBar(
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
        title: Text(
          'Pets Care',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      drawer: MyAppDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(MyColors.kBlack, BlendMode.softLight),
            image: AssetImage("assets/images/pet.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
              ),
              SizedBox(
                height: 10,
              ),

              // All Doctors and View Hospitals button
              Center(
                child: Container(
                  child: Column(
                    children: [
                      // first two button of all doctors and View Hospitals
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          // row for two buttons
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              //All Doctors Container and Button
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return AllDoctors();
                                  }));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: MyColors.kSecondary,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.kBlack,
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: Offset(
                                          0,
                                          5,
                                        ), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/doctor.png"),
                                          size: 72,
                                          color: MyColors.kPrimary,
                                        ),
                                         SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70,
                                        ),
                                        Text('All Doctors'),
                                      ],
                                    ),
                                  ),
                                ),
                              ), // container for chating Doctor will move to next screen
                              SizedBox(
                                width: 15,
                              ),

                              // View Hospitals Container and Button
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return AllHospitals();
                                  }));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: MyColors.kSecondary,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.kBlack,
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: Offset(
                                          0,
                                          5,
                                        ), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/hospitalk.png"),
                                          size: 72,
                                          color: MyColors.kPrimary,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70,
                                        ),
                                        Text('View Hospitals'),
                                      ],
                                    ),
                                  ),
                                ),
                              ), // container for chating Doctor will move to next screen

                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // Pets Market and Share App Buttons
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          // Row containing Pets Market and Share App Buttons
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),

                              // Pets Market Button
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return PetsMarket();
                                  }));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: MyColors.kSecondary,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: Offset(
                                          0,
                                          5,
                                        ), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/pets-market.png"),
                                          size: 72,
                                          color: MyColors.kPrimary,
                                        ),
                                         SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70,
                                        ),
                                        
                                        Text('Pets Market'),
                                      ],
                                    ),
                                  ),
                                ),
                              ), // container for chating Doctor will move to next screen
                              SizedBox(
                                width: 15,
                              ),
                              // Share App Button
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PetsRegistration()));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: MyColors.kSecondary,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: Offset(
                                          0,
                                          5,
                                        ), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/acquisition.png"),
                                          size: 72,
                                          color: MyColors.kPrimary,
                                        ),
                                         SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70,
                                        ),
                                        Text('Sell your pets'),
                                      ],
                                    ),
                                  ),
                                ),
                              ), // container for chating Doctor will move to next screen
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              // About US Area
            ],
          ),
        ),
      ),
      // bottomSheet: BottomSheet(
      //   backgroundColor: MyColors.myScaffoldBackColor,
      //   onClosing: () {},
      //   builder: (context) {
      //     return Container(
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         //height: 120,
      //         child: Padding(
      //           padding: const EdgeInsets.only(
      //             left: 20,
      //             top: 20,
      //           ),
      //           child: Column(
      //             children: [
      //               Row(
      //                 children: [
      //                   Text(
      //                     'About US',
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.black,
      //                       fontSize: 16,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SingleChildScrollView(
      //                 // scrollDirection: Axis.horizontal,
      //                 child: Row(
      //                   //mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                       width: 50,
      //                       height: 50,
      //                       child: Image.asset(
      //                           'assets/images/aboutusImages/youtubeIcon.png'),
      //                     ),
      //                     SizedBox(
      //                       width: 15,
      //                     ),
      //                     Container(
      //                       width: 35,
      //                       height: 35,
      //                       child: Image.asset(
      //                           'assets/images/aboutusImages/facebookIcon.png'),
      //                     ),
      //                     SizedBox(
      //                       width: 15,
      //                     ),
      //                     Container(
      //                       width: 35,
      //                       height: 35,
      //                       child: Image.asset(
      //                           'assets/images/aboutusImages/kawishIcon.png'),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       height: 90,
      //       decoration: BoxDecoration(
      //         color: MyColors.kSecondary,
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(1),
      //           topRight: Radius.circular(1),
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.black,
      //             blurRadius: 15,
      //             spreadRadius: 2,
      //             offset: Offset(
      //               0,
      //               5,
      //             ), // Shadow position
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
   
    );
  }
}
