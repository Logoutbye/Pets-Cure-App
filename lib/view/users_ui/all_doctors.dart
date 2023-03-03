import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/data/response/status.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view_model/all_doctors_view_model.dart';
import 'package:provider/provider.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({super.key});

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  // creating object of viewmodel class to then fetch all the doctors from api
  AllDoctorsViewModel allDoctorsViewModel = AllDoctorsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    allDoctorsViewModel.fetchAllDoctorsDataFromApiFunc();
    // if (kDebugMode) {
    //   print(allDoctorsViewModel.allDoctorList);
    // }
    super.initState();
  }

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
      body: ChangeNotifierProvider<AllDoctorsViewModel>(
        create: (_) => allDoctorsViewModel,
        child: Consumer<AllDoctorsViewModel>(builder: (context, value, child) {
          switch (value.allDoctorList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.COMPLETED:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.1,
                        child: ListView.separated(
                          itemCount:
                              allDoctorsViewModel.allDoctorList.data!.length,
                          itemBuilder: (context, index) {
                            final indexItem =
                                allDoctorsViewModel.allDoctorList.data![index];
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
                                          // This Container is Name of Doctor name and pictures with Hospital Name
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 244, 241, 241),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        // Image of Hospital
                                                        Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            radius: 100,
                                                            backgroundImage:
                                                                AssetImage(
                                                              'assets/images/pakflag.png',
                                                            ),
                                                          ),
                                                        ),
                                                        // Doctor Name and location
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Container(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 30),
                                                                          child:
                                                                              Text(
                                                                            indexItem.doctorName!,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.blue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.location_on,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            Text(
                                                                              indexItem.hospitalName!,
                                                                              style: TextStyle(
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.black,
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
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 244, 241, 241),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Center(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          // Fee of Docotr
                                                          Column(
                                                            children: [
                                                              // Fee Icon and fee text container
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 10,
                                                                        left:
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(Icons
                                                                          .money),
                                                                      Text(
                                                                        'Fee',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14,
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
                                                                      indexItem
                                                                          .doctorFee!,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          // Doctor Rating
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                // Star Icon
                                                                Container(
                                                                  child: Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amberAccent,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                // Star Icon
                                                                Container(
                                                                  child: Text(
                                                                      indexItem
                                                                          .doctorRatings!),
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
                                          ),
                                          // Call Help line and view profile button
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  // Book Appointment or contact doctor
                                                  Container(
                                                    //color: Colors.white,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: OutlinedButton(
                                                      child: Text(
                                                        'Contact Doctor',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(MyColors
                                                                    .myButtonsBackgroundColor),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black),
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
              );
            case Status.ERROR:
              print(value.allDoctorList.message.toString());
              return Center(
                  child: Text(value.allDoctorList.message.toString()));
          }
        }),
      ),
    );
  }
}
