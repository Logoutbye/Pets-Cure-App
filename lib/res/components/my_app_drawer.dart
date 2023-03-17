import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view/auth_ui/LoginScreen.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/PetsMarket.dart';
import 'package:mvvm_practice_app/view/users_ui/all_doctors.dart';
import 'package:mvvm_practice_app/view/users_ui/all_hospitals.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({super.key});

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
                      backgroundImage: AssetImage('assets/images/pet.jpg'),
                    ),
                  ),
                  // USer Name
                  Text(
                    'Idrees Afridi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Gmail
                  Text(
                    'idrees@gmail.com',
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
          // Divider(),
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
                return PetsMarket();
              }));
            },
          ), //Dashboard
          // logout / Login
          ListTile(
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
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return searchKeywordScreen();
              // }));
            },
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
              // Navigator.of(context).pop();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) {
              //   return searchKeywordScreen();
              // }));
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
            onTap: () async{
              var prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
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
}
