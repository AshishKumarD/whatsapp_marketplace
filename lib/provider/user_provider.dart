import 'package:flutter/material.dart';
import 'package:whatsapp_marketplace/model/chatModel.dart';

class UserProvider extends ChangeNotifier {
  final List<ChatModel> _users = [
    ChatModel(
      name: 'User 1',
      id: 1,
      isGroup: true,
      groupName: 'Apple Market Group',
      currentMessage: 'Hi, i am user 1',
      time: "12:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'User 2',
      id: 2,
      isGroup: true,
      groupName: 'Apple Market Group',
      currentMessage: 'Hi, i am user 2',
      time: "14:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Ashish',
      id: 3,
      isGroup: true,
      groupName: 'Apple Market Group',
      currentMessage: 'Hi, i am ashish',
      time: "09:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'bob',
      id: 4,
      isGroup: false,
      currentMessage: 'Hi, i am bob',
      time: "19:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Erza Scarlet',
      id: 5,
      isGroup: false,
      currentMessage: 'Hi, i am from erza',
      time: "09:00",
      icon: Icons.person,
    ),
  ];

  List<ChatModel> get users => _users;
}
