import 'package:flutter/material.dart';
import 'package:whatsapp_marketplace/model/chatModel.dart';
import 'package:whatsapp_marketplace/screens/conversation_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chatUser}) : super(key: key);
  // final ChatModel chatsModel;
  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(
                      //    chatsModel: chatsModel,
                      chatUser: chatUser,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(chatUser.isGroup ? Icons.groups : Icons.person,
                  color: Colors.white, size: 38),
              //backgroundColor: Colors.greenAccent,
            ),
            title: Text(
              chatUser.isGroup ? chatUser.groupName : chatUser.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 15,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    chatUser.currentMessage,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            trailing: Text(chatUser.time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
