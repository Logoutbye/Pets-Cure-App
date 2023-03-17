import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_practice_app/model/chat_message_model.dart';
import 'package:mvvm_practice_app/res/my_app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Message> message = [
      Message(text: "text", dateTime: DateTime(2023, 1, 15), issentByMe: true),
      Message(text: "text", dateTime: DateTime(2023, 1, 16), issentByMe: true),
      Message(text: "text", dateTime: DateTime(2023, 1, 17), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime(2023, 2, 10), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime(2023, 2, 20), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: true),
      Message(text: "text", dateTime: DateTime.now(), issentByMe: false),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kPrimary,
        foregroundColor: MyColors.KWhite,
        title: Text("Chat"),
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
            groupBy: (message) => DateTime(message.dateTime.year,
                message.dateTime.month, message.dateTime.day),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: MyColors.kPrimary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateFormat.yMMMd().format(message.dateTime),
                      style: TextStyle(color: MyColors.KWhite),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.issentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(message.text),
                ),
              ),
            ),
          )),
          Container(
            color: MyColors.kSecondary,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        fillColor: MyColors.kSecondary,
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Type your message here"),
                    onSubmitted: (text) {
                      final messages = Message(
                          text: text,
                          dateTime: DateTime.now(),
                          issentByMe: true);
                      setState(() => message.add(messages));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
