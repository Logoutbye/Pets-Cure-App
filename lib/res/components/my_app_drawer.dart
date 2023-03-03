import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view/pets_market_ui/PetsMarket.dart';
import 'package:mvvm_practice_app/view/users_ui/all_doctors.dart';
import 'package:mvvm_practice_app/view/users_ui/all_hospitals.dart';

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
                  Container(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/pet.jpg'),
                    ),
                  ),
                  Text(
                    'Idrees Afridi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
          // privacy Policy
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.privacy_tip,
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
          // search Doctor
          ListTile(
            focusColor: Colors.red,
            hoverColor: Colors.amberAccent,
            selectedColor: Colors.white,
            selectedTileColor: Colors.green,
            leading: Icon(
              Icons.person,
              color: MyColors.myButtonsBackgroundColor,
            ),
            title: Text(
              "Search Doctor",
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
            leading: Icon(
              Icons.local_hospital,
              color: MyColors.myButtonsBackgroundColor,
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
            leading: Icon(
              Icons.pets,
              color: MyColors.myButtonsBackgroundColor,
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
              Icons.contact_page_sharp,
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
              Icons.star,
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
              Icons.share,
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
        ],
      ),
    );
  }
}
