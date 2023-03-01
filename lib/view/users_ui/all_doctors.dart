import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({super.key});

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myScaffoldBackColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 2, 140, 253),
        ),
        title: Text(
          'All Doctors',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      drawer: MyAppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.1,
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(
                                    0,
                                    0,
                                  ), // Shadow position
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                              ),
                              child: Column(
                                children: [
                                  // This Container is Loaction hospital name and pictures
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 244, 241, 241),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 20,
                                            spreadRadius: 3,
                                            offset: Offset(
                                              0,
                                              0,
                                            ), // Shadow position
                                          ),
                                        ],
                                      ),
                                      //color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Image of Hospital
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    radius: 100,
                                                    backgroundImage: AssetImage(
                                                      'assets/images/pakflag.png',
                                                    ),
                                                  ),
                                                ),
                                                // Hospital Name and location
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          30),
                                                                  child: Text(
                                                                    "Al khadmat Hospitals ",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      'City Circular Road Near Telnor Franchise',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Oppening and closing Hour
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      // width:
                                      //MediaQuery.of(context).size.width,
                                      //height: 40,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 244, 241, 241),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                            offset: Offset(
                                              0,
                                              0,
                                            ), // Shadow position
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: Center(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      // Fee Icon and fee text container
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                left: 0),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(Icons.money),
                                                              Text(
                                                                'Fee',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      // fee in digit container
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '1000',
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Call Help line and view profile button
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          // color: Color.fromARGB(
                                          //     255, 221, 219, 219),

                                          ),
                                      child: Column(
                                        children: [
                                          // Book Appointment or contact doctor
                                          Container(
                                            //color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: OutlinedButton(
                                              child: Text(
                                                'Contact Doctor',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(MyColors
                                                            .myButtonsBackgroundColor),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    side: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
