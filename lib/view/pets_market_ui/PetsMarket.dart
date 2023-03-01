//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';

class PetsMarket extends StatefulWidget {
  const PetsMarket({super.key});

  @override
  State<PetsMarket> createState() => _PetsMarketState();
}

class _PetsMarketState extends State<PetsMarket> {
  List<String> imagesLink = [
    'https://i.natgeofe.com/k/63b1a8a7-0081-493e-8b53-81d01261ab5d/red-panda-full-body_4x3.jpg',
    'https://images.immediate.co.uk/production/volatile/sites/23/2022/08/GettyImages-1130384417-c635a0a.jpg?quality=90&resize=620%2C413',
    'https://media.wired.com/photos/593261cab8eb31692072f129/master/pass/85120553.jpg',
    'https://aldf.org/wp-content/uploads/2018/05/lamb-iStock-665494268-16x9-e1559777676675-1200x675.jpg',
    'https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?cs=srgb&dl=pexels-pixabay-47547.jpg&fm=jpg',
  ];
  List<String> usersName = [
    'Alpha',
    'Beta',
    'Gemma',
    'Femta',
    'Pico',
  ];

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
          'Pets Market',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      drawer: MyAppDrawer(),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                // Container Containe Listtile show all the user informaton header of the post
                Container(
                  color: MyColors.myButtonsBackgroundColor,
                  //Color.fromARGB(255, 194, 172, 172),
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          imagesLink[index],
                        ),
                      ),
                    ),
                    title: Container(
                      child: Text(
                        usersName[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    subtitle: Container(
                      child: Text(
                        '1 Day Ago',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Available'),
                      ),
                    ),
                  ),
                ),

                // Container that Contains image of the pet and discription of the pet
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        spreadRadius: 0.5,
                        offset: Offset(
                          0,
                          0,
                        ), // Shadow position
                      ),
                    ],
                  ),
                  //height: MediaQuery.of(context).size.height / 3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Image of the pet container
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 4.8,
                          child: Image.network(
                            imagesLink[index],
                            fit: BoxFit.fill,
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 4,
                          //color: Colors.red,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Discription container
                                    Container(
                                      child: Text(
                                        'Hello this is Pets Post Screen which show all the infor information'
                                        'about the pets you want to buy',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Price Container
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            MyColors.myButtonsBackgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Text(
                                          'Rs10,000',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 6,
                ),

                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 6,
          );
        },
      ),
    );
  }
}
