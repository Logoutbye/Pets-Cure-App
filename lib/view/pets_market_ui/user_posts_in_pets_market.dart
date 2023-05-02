import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_practice_app/data/response/status.dart';
import 'package:mvvm_practice_app/res/components/my_app_drawer.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/my_post_update_delete_screen.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/onBoard_screen.dart';
import 'package:mvvm_practice_app/view_model/all_pets_petsmarket_view_model.dart';
import 'package:provider/provider.dart';

class MyPostsInPetsMarket extends StatefulWidget {
  const MyPostsInPetsMarket({super.key});

  @override
  State<MyPostsInPetsMarket> createState() => _MyPostsInPetsMarketState();
}

class _MyPostsInPetsMarketState extends State<MyPostsInPetsMarket> {
  AllPetsMarketViewModel allPetsMarketViewModel = AllPetsMarketViewModel();

  @override
  void initState() {
    // TODO: implement initState
    allPetsMarketViewModel.fetchAllPetsPostsofUserFromPetsMarket(
        MySharedPrefencesSessionHandling.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyColors.KWhite,
        backgroundColor: MyColors.kPrimary,
        title: Text(
          'My Posts in Pets Market',
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
                mainAxisSpacing: 3,
                padding: EdgeInsets.all(8),
                children: List.generate(
                    allPetsMarketViewModel.allMarketPets.data!.length, (index) {
                  final itemIndex =
                      allPetsMarketViewModel.allMarketPets.data![index];
                  return GestureDetector(
                    
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyPostUpdateDeleteScreen(
                          postId:itemIndex.id ,
                            petimage: itemIndex.petImage.toString(),
                            username: MySharedPrefencesSessionHandling.name,
                            petname: itemIndex.petName,
                            petDescription: itemIndex.petDescription,
                            petAvalability: itemIndex.petStatus!.toString(),
                            price: itemIndex.petPrice!,
                            userId: itemIndex.userId!,
                            userImage:
                                MySharedPrefencesSessionHandling.user_image!
                            //itemIndex.userImage!,
                            ))),
                    child: Container(
                      // color: MyColors.kSecondary,
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
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
                                        MediaQuery.of(context).size.height / 15,
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
                                                  : "Not Available",
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
