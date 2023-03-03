//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/data/response/status.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view_model/all_doctors_view_model.dart';
import 'package:mvvm_practice_app/view_model/all_hospitals_view_model.dart';
import 'package:provider/provider.dart';

//import 'package:dropdown_formfield/dropdown_formfield.dart';

class AllHospitals extends StatefulWidget {
  const AllHospitals({super.key});

  @override
  State<AllHospitals> createState() => _AllHospitalsState();
}

class _AllHospitalsState extends State<AllHospitals> {
  // creating object of viewmodel class to then fetch all the doctors from api
  AllHospitalViewModel allHospitalViewModel = AllHospitalViewModel();

  var values = "-1";
  late String ValueChoose;

  @override
  void initState() {
    // TODO: implement initState
    allHospitalViewModel.fetchAllHospitalsDataFromRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myScaffoldBackColor,
      appBar: AppBar(
        title: Text(
          'All Hospitals ',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 2, 140, 253),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: MyAppDrawer(),
      body: ChangeNotifierProvider<AllHospitalViewModel>(
        create: (_) => allHospitalViewModel,
        child: Consumer<AllHospitalViewModel>(builder: (context, value, child) {
          switch (value.allHospitals.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());

            case Status.COMPLETED:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // Container shows the location where you can get hospitals
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Text(
                              'All Hospitals in Peshawar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Text(
                              '10 Million+ People Have Used Marham',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //   This Container is whole 7 container ListView Builder
                    // Column(
                    //   children: [
                    //  All Hospitals
                    Container(
                      width: MediaQuery.of(context).size.width / 1.09,
                      decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 231, 40, 40),
                          //borderRadius: BorderRadius.circular(10),
                          ),
                      child: SizedBox(
                        //width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: ListView.separated(
                          itemCount:
                              allHospitalViewModel.allHospitals.data!.length,
                          itemBuilder: (context, index) {
                            final itemIndex =
                                allHospitalViewModel.allHospitals.data![index];
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
                                                          width: 60,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: CircleAvatar(
                                                            radius: 100,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/images/pakflag.png'),
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
                                                                      // Hospital Name
                                                                      Container(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 30),
                                                                          child:
                                                                              Text(
                                                                            itemIndex.hospitalName!,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.blue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // Hospital address
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.location_on,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            Text(
                                                                              itemIndex.hospitalAddress!,
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
                                              // width:
                                              //MediaQuery.of(context).size.width,
                                              //height: 40,
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
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            // Hours Title and icon
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 20,
                                                                      left: 10),
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(Icons
                                                                        .blur_on),
                                                                    Text(
                                                                      'Opening Hours',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            // Hospital Hours
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    itemIndex
                                                                        .hospitalOpeningHours!,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Availible Doctors
                                                        Column(
                                                          children: [
                                                            // Avilible Doctors Title
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 20,
                                                              ),
                                                              child: Container(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 30),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .blur_on),
                                                                      Text(
                                                                        "Avaible Doctors is ",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // availible doctors
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "3",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
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
                                                  // call helpline button
                                                  Container(
                                                    //color: Colors.white,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: OutlinedButton(
                                                      child: Text(
                                                        'Call Helpline',
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
                                                  // view profile button
                                                  Container(
                                                    //color: Colors.white,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: OutlinedButton(
                                                      child: Text(
                                                        'View Profile ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
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
                                                  )
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
                    )
                    //   ],
                    // ),
                    //////////////////////////////////
                  ],
                ),
              );

            case Status.ERROR:
              return Center(child: Text(value.allHospitals.message.toString()));
          }
        }),
      ),
    );
  }
}
