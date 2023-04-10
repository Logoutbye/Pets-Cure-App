//import 'dart:js_util';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_practice_app/data/response/status.dart';
import 'package:mvvm_practice_app/model/all_pets_petsmarket_data_model.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/onBoard_screen.dart';
import 'package:mvvm_practice_app/view_model/all_pets_petsmarket_view_model.dart';
import 'package:provider/provider.dart';

class PetsMarket extends StatefulWidget {
  PetsMarket({super.key});

  @override
  State<PetsMarket> createState() => _PetsMarketState();
}

class _PetsMarketState extends State<PetsMarket> {
  AllPetsMarketViewModel allPetsMarketViewModel = AllPetsMarketViewModel();

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
  void initState() {
    // TODO: implement initState
    allPetsMarketViewModel.fetchAllPetsFromPetsMarketApiList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.KWhite,
      appBar: AppBar(
        foregroundColor: MyColors.KWhite,
        backgroundColor: MyColors.kPrimary,
        title: Text(
          'Pets Market',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      drawer: MyAppDrawer(),
      body: ChangeNotifierProvider<AllPetsMarketViewModel>(
        create: (_) => allPetsMarketViewModel,
        child:
            Consumer<AllPetsMarketViewModel>(builder: (context, value, child) {
          switch (value.allMarketPets.status!) {
            case Status.LOADING:
              return Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json',
                  width: 100,
                  fit: BoxFit.fill,
                ),
              );
            case Status.COMPLETED:
              return ListView.separated(
                itemCount: allPetsMarketViewModel.allMarketPets.data!.length,
                itemBuilder: (context, index) {
                  final itemIndex =
                      allPetsMarketViewModel.allMarketPets.data![index];
                  //Uint8List bytes = utf8.encode(itemIndex.petImage);
                  // Uint8List uint8list2 = Uint8List.fromList(
                  //     utf8.encode(itemIndex.petImage!.toString()));
                  return Container(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OnBoardScreen(
                                petimage: itemIndex.petImage.toString(),
                                username: usersName[index],
                                petname: itemIndex.petName,
                                petDescription: itemIndex.petDescription,
                                petAvalability: itemIndex.petStatus!.toString(),
                                price: itemIndex.petPrice!,
                                userId: itemIndex.userId!,
                                userImage: itemIndex.userImage!,
                              ))),
                      child: Column(
                        children: [
                          // Container Containe Listtile show all the user informaton header of the post
                          Container(
                            color: MyColors.kPrimary,
                            //Color.fromARGB(255, 194, 172, 172),
                            child: ListTile(
                              // User Profile Url
                              leading: Container(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    imagesLink[0],
                                  ),
                                ),
                              ),

                              // User Name
                              title: Container(
                                child: Text(
                                  usersName[0],
                                  style: TextStyle(
                                    color: MyColors.KWhite,
                                  ),
                                ),
                              ),

                              // Post time
                              subtitle: Container(
                                child: Text(
                                  '1 Day Ago',
                                  style: TextStyle(color: MyColors.KWhite),
                                ),
                              ),

                              // Pet availible or not
                              trailing: Container(
                                decoration: BoxDecoration(
                                  color: MyColors.KWhite,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: itemIndex.petStatus!.toString() == '1'
                                      ? Text('Availible')
                                      : Text('Not-Availible'),
                                ),
                              ),
                            ),
                          ),

                          // Container that Contains image of the pet and discription of the pet
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: MyColors.KWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.kBlack,
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
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: MediaQuery.of(context).size.height /
                                        4.8,
                                    child: Image.network(
                                      itemIndex.petImage.toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 50,
                                        );
                                      },
                                    ),
                                  ),

                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    //color: Colors.red,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              //Discription container
                                              Container(
                                                child: Text(
                                                  '${itemIndex.petName}' +
                                                      ' : ' +
                                                      '${itemIndex.petDescription!}'
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: MyColors.kBlack,
                                                  ),
                                                ),
                                              ),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              // Price Container
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: MyColors.kPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Text(
                                                    'PKR: ' +
                                                        itemIndex.petPrice!
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: MyColors.KWhite,
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
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 6,
                  );
                },
              );

            case Status.ERROR:
              return Center(
                  child: Text(value.allMarketPets.message.toString()));
          }
        }),
      ),
    );
  }
}
