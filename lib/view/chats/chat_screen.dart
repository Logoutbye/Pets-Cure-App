import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_practice_app/model/chat_message_model.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

class ChatScreen extends StatefulWidget {
  String Name;
  String Pic;
  ChatScreen({required this.Name, required this.Pic, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String name = "";
  String pic = "";
  @override
  void initState() {
    name = widget.Name;
    pic = widget.Pic;
    // TODO: implement initState
    super.initState();
  }

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
 List<Message> message = [
    
    //adding data into model for Today date
    Message(timeStamp: DateTime.now()  , message: 'Hello Today Message and testing long thread for this i hope this will work', isMe: true),
    Message(timeStamp: DateTime.now()  , message: 'Hello Today Message',  isMe: false),
    Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: true),
    Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: false),
    Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: true),
    Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: false),

    //adding data into model for yesterday date
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 11,30 )  , message: 'Yesterday Message', isMe: true),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 11,30 )  , message: 'Yesterday Message',  isMe: false),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 11,30 )  , message: 'Yesterday Message', isMe: true),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 14,30 )  , message: 'Yesterday Message',  isMe: false),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 14,30 )  , message: 'Yesterday Message',  isMe: true),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 14,30 )  , message: 'Yesterday Message',  isMe: false),

    //adding data into model date
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: true),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: false),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: true),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: false),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: true),

    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: false),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: true),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: false),
    Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: true),


    Message(timeStamp: DateTime(2023,02,08, 15,20 ) , message: 'Feb 8th Message' , isMe: true),
    Message(timeStamp: DateTime(2023,02,08, 15,20 ) , message: 'Feb 8th Message' , isMe: false),
    Message(timeStamp: DateTime(2023,02,08, 15,20 ) , message: 'Feb 8th Message' , isMe: true),
    Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: true),
    Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: false),
    Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: true),
    Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: false),

  ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
        title: Row(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width / 7.5,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     shape: BoxShape.circle,
            //   ),
            //   child: CircleAvatar(
            //     backgroundColor: Colors.transparent,
            //     radius: 50,
            //     child: ClipOval(
            //       child: Image.network(
            //         pic,
            //         fit: BoxFit.cover,
            //         errorBuilder: (context, error, stackTrace) {
            //           return Icon(
            //             Icons.error,
            //             color: Colors.red,
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            Text("${name}"),
          ],
        ),
        leading: Row(
          children: [
            // IconButton(
              
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(Icons.arrow_back)),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      pic,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.error,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            padding: EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: message,
            groupBy: (message) => DateTime(message.timeStamp.year,
                message.timeStamp.month, message.timeStamp.day),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: MyColors.kPrimary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateFormat.yMMMd().format(message.timeStamp),
                      style: TextStyle(color: MyColors.KWhite),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                padding: message.isMe
                    ? EdgeInsets.fromLTRB(50, 8, 0, 8)
                    : EdgeInsets.fromLTRB(0, 8, 50, 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: message.isMe
                          ? MyColors.kPrimary
                          : MyColors.kSecondary,
                      borderRadius: message.isMe
                          ? BorderRadius.only(
                              bottomRight: Radius.circular(29),
                              bottomLeft: Radius.circular(29),
                              topLeft: Radius.circular(29))
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(29),
                              bottomRight: Radius.circular(29),
                              topRight: Radius.circular(29))),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      message.message,
                      style: TextStyle(
                          color: message.isMe
                              ? MyColors.KWhite
                              : MyColors.kBlack),
                    ),
                  ),
                ),
              ),
            ),
          )),
          Container(
            color: MyColors.kSecondary,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          fillColor: MyColors.kSecondary,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29),
                              gapPadding: 10,
                              borderSide: BorderSide(width: 0)),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Type your message here"),
                      // onChanged: (text) {
                      //   final messages = Message(
                      //       text: text,
                      //       dateTime: DateTime.now(),
                      //       issentByMe: true);
                      //   setState(() => message.add(messages));
                      // },
                      onSubmitted: (text) {
                        print("check");
                        final messages = Message(
                            message: text,
                            timeStamp: DateTime.now(),
                            isMe: true);
                        setState() {
                          message.add(messages);
                        }

                        print("check::${message.length}");
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // post method here

                    print("check");
                    final messages = Message(
                        message: textController.text,
                        timeStamp: DateTime.now(),
                        isMe: true);
                    setState() {
                      message.add(messages);
                      // message.add(Message(
                      //     text: textController.text,
                      //     dateTime: DateTime.now(),
                      //     issentByMe: true));
                    }

                    // print("check::${messages.dateTime}");
                    print("check:::${message.length}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: MyColors.kPrimary),
                        child: Icon(
                          Icons.send,
                          color: MyColors.kSecondary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
