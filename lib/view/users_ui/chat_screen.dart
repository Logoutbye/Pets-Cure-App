// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:intl/intl.dart';
// import 'package:mvvm_practice_app/model/chat_message_model.dart';
// import 'package:mvvm_practice_app/res/my_app_colors.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//      List<Message> message = [
    
//     //adding data into model for Today date
//     Message(timeStamp: DateTime.now()  , message: 'Hello Today Message and testing long thread for this i hope this will work', isMe: true),
//     Message(timeStamp: DateTime.now()  , message: 'Hello Today Message',  isMe: false),
//     Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: true),
//     Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: false),
//     Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: true),
//     Message(timeStamp: DateTime.now()  , message: 'Hello Today Message', isMe: false),

//     //adding data into model for yesterday date
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 11,30 )  , message: 'Yesterday Message', isMe: true),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 11,30 )  , message: 'Yesterday Message',  isMe: false),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 11,30 )  , message: 'Yesterday Message', isMe: true),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 14,30 )  , message: 'Yesterday Message',  isMe: false),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 14,30 )  , message: 'Yesterday Message',  isMe: true),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1, 14,30 )  , message: 'Yesterday Message',  isMe: false),

//     //adding data into model date
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: true),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: false),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: true),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: false),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2, 14,30 )  , message: 'Some Message',  isMe: true),

//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: false),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: true),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: false),
//     Message(timeStamp: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3, 14,30 )  , message: 'Some Message',  isMe: true),


//     Message(timeStamp: DateTime(2023,02,08, 15,20 ) , message: 'Feb 8th Message' , isMe: true),
//     Message(timeStamp: DateTime(2023,02,08, 15,20 ) , message: 'Feb 8th Message' , isMe: false),
//     Message(timeStamp: DateTime(2023,02,08, 15,20 ) , message: 'Feb 8th Message' , isMe: true),
//     Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: true),
//     Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: false),
//     Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: true),
//     Message(timeStamp: DateTime(2023,01,20, 15,20 ) , message: '20 JanMessage' , isMe: false),

//   ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.kPrimary,
//         foregroundColor: MyColors.KWhite,
//         title: Text("Chat"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: GroupedListView<Message, DateTime>(
//             padding: EdgeInsets.all(8),
//             reverse: true,
//             order: GroupedListOrder.DESC,
//             useStickyGroupSeparators: true,
//             floatingHeader: true,
//             elements: message,
//             groupBy: (message) => DateTime(message.timeStamp.year,
//                 message.timeStamp.month, message.timeStamp.day),
//             groupHeaderBuilder: (Message message) => SizedBox(
//               height: 40,
//               child: Center(
//                 child: Card(
//                   color: MyColors.kPrimary,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       DateFormat.yMMMd().format(message.timeStamp),
//                       style: TextStyle(color: MyColors.KWhite),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             itemBuilder: (context, Message message) => Align(
//               alignment: message.isMe
//                   ? Alignment.centerRight
//                   : Alignment.centerLeft,
//               child: Card(
//                 elevation: 8,
//                 child: Padding(
//                   padding: EdgeInsets.all(8),
//                   child: Text(message.message),
//                 ),
//               ),
//             ),
//           )),
//           Container(
//             color: MyColors.kSecondary,
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: textController,
//                     decoration: InputDecoration(
//                         fillColor: MyColors.kSecondary,
//                         contentPadding: EdgeInsets.all(8),
//                         hintText: "Type your message here"),
//                     onSubmitted: (text) {
//                       final messages = Message(
//                           message: text,
//                           timeStamp: DateTime.now(),
//                           isMe: true);
//                       setState(() => message.add(messages));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
