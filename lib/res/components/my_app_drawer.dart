import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailto/mailto.dart';
import 'package:mvvm_practice_app/res/components/my_static_component%20.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/utils/utils.dart';
import 'package:mvvm_practice_app/view/auth_ui/LoginScreen.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/PetsMarket.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/grid_view_pets_market.dart';
import 'package:mvvm_practice_app/view/users_ui/all_doctors.dart';
import 'package:mvvm_practice_app/view/users_ui/all_hospitals.dart';
import 'package:mvvm_practice_app/view/users_ui/user_profile/edit_profile.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/user_posts_in_pets_market.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppDrawer extends StatefulWidget {
  MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.KWhite,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: GestureDetector(
              onTap: () {
                if (MySharedPrefencesSessionHandling.name == null) {
                  Utils.flushBarErrorMessageWithAction(
                      "Please log in to continue", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    print("object");
                  }, context);
                } else {
                  Navigator.pop(context);
                  // Future.delayed(Duration(seconds: 4), () async {});
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile()));
                }
              },
              child: Container(
                decoration: BoxDecoration(color: MyColors.kPrimary),
                child:
                    // waiter == false
                    //     ? Center(
                    //         child: CircularProgressIndicator(
                    //           color: Colors.black,
                    //         ),
                    //       )
                    //     :
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Image
                    Container(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: MySharedPrefencesSessionHandling
                                        .user_image ==
                                    null ||
                                MySharedPrefencesSessionHandling.user_image ==
                                    'no'
                            ? AssetImage(
                                'assets/images/user.png',
                              )
                            // ? Image.asset('assets/images/user.png',fit,).image
                            : Image.network(
                                    '${MySharedPrefencesSessionHandling.user_image}')
                                .image,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: MyColors.kSecondary,
                              child: Icon(Icons.edit),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // USer Name
                    Text(
                      MySharedPrefencesSessionHandling.name == null
                          ? 'Guest User'
                          : '${MySharedPrefencesSessionHandling.name}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // Gmail
                    Text(
                      MySharedPrefencesSessionHandling.email == null
                          ? ''
                          : '${MySharedPrefencesSessionHandling.email}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // my Chats screen
          // ListTile(
          //   focusColor: Colors.red,
          //   hoverColor: Colors.amberAccent,
          //   selectedColor: Colors.white,
          //   selectedTileColor: Colors.green,
          //   leading: ImageIcon(
          //     AssetImage("assets/images/pets-market.png"),
          //     size: 30,
          //     color: MyColors.kPrimary,
          //   ),
          //   title: Text(
          //     "My Chats",
          //     style: TextStyle(color: Colors.black, fontSize: 16),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //       return EditProfile();
          //     }));
          //   },
          // ), //Dashboard

          // My Posts
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: ImageIcon(
              AssetImage("assets/images/pets-market.png"),
              size: 30,
              color: MyColors.kPrimary,
            ),
            title: Text(
              "My Posts",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MyPostsInPetsMarket();
              }));
            },
          ), //Dashboard

          Divider(
            thickness: 1,
            color: MyColors.kPrimary,
          ),
          // Dashboard
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.dashboard_outlined,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return HomeScreen();
              // }));
            },
          ), //Dashboard
          // All Doctor
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: ImageIcon(
              AssetImage("assets/images/doctor.png"),
              size: 33,
              color: MyColors.kPrimary,
            ),
            // Icon(
            //   Icons.person,
            //   color: MyColors.myButtonsBackgroundColor,
            // ),
            title: Text(
              "All Doctors",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AllDoctors();
              }));
            },
          ), //Dashboard
          // View Hospitals
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: ImageIcon(
              AssetImage("assets/images/hospitalk.png"),
              size: 27,
              color: MyColors.kPrimary,
            ),
            title: Text(
              "View Hospitals",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AllHospitals();
              }));
            },
          ), //Dashboard
          // pets Market
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: ImageIcon(
              AssetImage("assets/images/pets-market.png"),
              size: 30,
              color: MyColors.kPrimary,
            ),
            title: Text(
              "Pets Market",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GridViewPetsMarket();
                //  PetsMarket();
              }));
            },
          ), //Dashboard
          // logout / Login
          MySharedPrefencesSessionHandling.isUserLogedIn == false
              ? ListTile(
                  focusColor: Colors.red,
                  hoverColor: Colors.amberAccent,
                  selectedColor: Colors.white,
                  selectedTileColor: Colors.green,
                  leading: Icon(
                    Icons.login,
                    color: MyColors.myButtonsBackgroundColor,
                  ),
                  title: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onTap: () async {
                    var prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isLogedIn', false);
                    await prefs.setInt('userId', 0);
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                )
              : SizedBox(
                  height: 0,
                ), //Dashboard
          SizedBox(
            height: 10,
          ),

          Divider(
            thickness: 1,
            color: MyColors.kPrimary,
          ),

          SizedBox(
            height: 10,
          ),

          // contact us
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.contact_page_outlined,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Contact US",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              funcOpenMailComposer();
            },
          ), //Dashboard

          // Rate US
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.star_outline,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Rate US",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              StoreRedirect.redirect(
                androidAppId: "com.kawiish.petscure",
              );
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return searchKeywordScreen();
              // }));
            },
          ), //Dashboard

          // share
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.share_outlined,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Share",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              Share.share(
                  'Hey everyone! If you\'re a pet lover like me, you have to check out this amazing pets app!  https://play.google.com/store/apps/details?id=com.kawiish.smartsilentt Download it now and let\'s start sharing our love for pets!.');

              // Navigator.of(context).pop();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return searchKeywordScreen();
              // }));
            },
          ), //Dashboard

          // privacy Policy
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.privacy_tip_outlined,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return searchKeywordScreen();
              // }));
            },
          ), //Dashboard

          // logout
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.logout,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: () async {
              // session hadnling
              var prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLogedIn', false);
              await prefs.setInt("userId", 0);
              MySharedPrefencesSessionHandling.isUserLogedIn = false;
              MySharedPrefencesSessionHandling.userId = 0;
              await MySharedPrefencesSessionHandling
                  .removeUserDataFromSharedPreferences();
              // Navigating to loginscreen
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
        ],
      ),
    );
  }

  void funcOpenMailComposer() async {
    final mailtoLink = Mailto(
      to: ['kashi7358@gmail.com'],
      // cc: ['idreeskhanapple0334@gmail.com','muhammadbilal03478@gmail.com'],
      subject: 'User Inquiry Regarding  Pets Cure',
      body: 'AOA!\nI would like to ',
    );
    await launch('$mailtoLink');
  }
}
