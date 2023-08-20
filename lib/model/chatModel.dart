import 'package:flutter/material.dart';

class ChatModel {
  String name;

  IconData icon;
  bool isGroup;
  String groupName;
  String time;
  String currentMessage;
  bool isMarket;
  bool select = false;
  int id;
  ChatModel({
    required this.name,
    this.icon = Icons.person,
    this.groupName = '',
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    this.isMarket = true,
    this.select = false,
    required this.id,
  });
}
