import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_marketplace/widgets/chat_widget.dart';

import '../provider/user_provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //List of users

  @override
  Widget build(BuildContext context) {
    print('${Provider.of<UserProvider>(context).users.length}');
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<UserProvider>(
          builder: (context, value, child) => Column(
            children: value.users
                .map((users) => ChatCard(
                      chatUser: users,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
