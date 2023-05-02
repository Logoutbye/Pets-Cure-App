import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/components/my_app_drawer.dart';
import '../../res/my_app_colors.dart';
import '../../view_model/all_pets_petsmarket_view_model.dart';
import 'onBoard_screen.dart';

class GridViewPetsMarket extends StatefulWidget {
  const GridViewPetsMarket({super.key});

  @override
  State<GridViewPetsMarket> createState() => _GridViewPetsMarketState();
}

class _GridViewPetsMarketState extends State<GridViewPetsMarket> {
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
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing:10,
                padding: EdgeInsets.all(8),
                children: List.generate(
                    allPetsMarketViewModel.allMarketPets.data!.length, (index) {
                  final itemIndex =
                      allPetsMarketViewModel.allMarketPets.data![index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OnBoardScreen(
                              petimage: itemIndex.petImage.toString(),
                              username: itemIndex.userName,
                              petname: itemIndex.petName,
                              petDescription: itemIndex.petDescription,
                              petAvalability: itemIndex.petStatus!.toString(),
                              price: itemIndex.petPrice!,
                              userId: itemIndex.userId!,
                              userImage: itemIndex.userImage!,
                              contact_no: itemIndex.petPrice.toString(),
                            ))),
                    child: Container(
                      // color: MyColors.kSecondary,
                      width: double.infinity,
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(29),
                                  ),
                                  color: MyColors.kSecondary),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      height:
                                          MediaQuery.of(context).size.height / 11,
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
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  99,
                                        ),
                                        Row(
                                          children: [
                                            Text('${itemIndex.petName}',
                                                style: TextStyle(
                                                  color: MyColors.kPrimary,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Spacer(),
                                            Text(
                                                itemIndex.petStatus!.toString() ==
                                                        'Yes'
                                                    ? "Available"
                                                    : "Sold Out",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption)
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  95,
                                        ),
                                        Text(
                                          '${itemIndex.petDescription}'
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              Theme.of(context).textTheme.caption,
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  70,
                                        ),
                                        Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/images/rupee-sign.png',
                                              ),
                                              color: MyColors.kPrimary,
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Text(
                                                  itemIndex.petPrice.toString(),
                                                  style: TextStyle(
                                                    color: MyColors.kPrimary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
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
