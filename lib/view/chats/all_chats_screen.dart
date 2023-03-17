import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';
import 'package:mvvm_practice_app/view/chats/chat_screen.dart';

class AllChatScreen extends StatefulWidget {
  const AllChatScreen({super.key});

  @override
  State<AllChatScreen> createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.KWhite,
      appBar: AppBar(
        title: Text("All Chats"),
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen(Name: "Name", Pic: "assets/images/doctor.png")));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.kSecondary,
                      ),
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/doctor.png")),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Time",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 90,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "DataDataDataDataDataataDataDataDataDataDataataDataDataDataDataDataataDataDataDataDataDataata",
                                  style: TextStyle(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
