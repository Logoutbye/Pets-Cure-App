import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_practice_app/data/response/status.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/res/components/round_button.dart';
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
      backgroundColor: MyColors.KWhite,
      appBar: AppBar(
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
        title: Text(
          'All Doctors',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      drawer: MyAppDrawer(),
      body: ChangeNotifierProvider<AllDoctorsViewModel>(
        create: (_) => allDoctorsViewModel,
        child: Consumer<AllDoctorsViewModel>(builder: (context, value, child) {
          switch (value.allDoctorList.status!) {
            case Status.LOADING:
              return Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json',
                  width: 100,
                  fit: BoxFit.fill,
                ),
              );
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
                                      color: MyColors.kSecondary,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        // BoxShadow(
                                        //   color: Colors.black,
                                        //   blurRadius: 10,
                                        //   spreadRadius: 2,
                                        //   offset: Offset(
                                        //     0,
                                        //     0,
                                        //   ), // Shadow position
                                        // ),
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
                                                        // Image of Doctor
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
                                                            radius: 50,
                                                            child: ClipOval(
                                                              child:
                                                                  Image.network(
                                                                indexItem
                                                                    .doctorImage!
                                                                    .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder:
                                                                    (context,
                                                                        error,
                                                                        stackTrace) {
                                                                  return Icon(
                                                                    Icons.error,
                                                                    color: Colors
                                                                        .red,
                                                                  );
                                                                },
                                                              ),
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
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              10,
                                                                              0,
                                                                              30,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            indexItem.doctorName!,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: MyColors.kPrimary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
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
                                                  RoundButton(
                                                      title: 'Contact Doctor',
                                                      onpress: () {
                                                        MyStaticComponents
                                                            .myAppDialogBox(
                                                                context,
                                                                'Mobile Number',
                                                                indexItem
                                                                    .doctorMobileNo!
                                                                    .toLowerCase());
                                                      },
                                                      width: 150),
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
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.allDoctorList.message.toString()),
                  TextButton(
                      onPressed: () {
                        allDoctorsViewModel.fetchAllDoctorsDataFromApiFunc();
                      },
                      child: Container(
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(
                              color: MyColors.kSecondary,
                              border: Border.all(
                                  width: 1, color: MyColors.kPrimary),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(29))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "Refresh",
                              style: TextStyle(
                                  color: MyColors.kPrimary,
                                  fontWeight: FontWeight.bold),
                            )),
                          ))),
                ],
              ));
          }
        }),
      ),
    );
  }
}
