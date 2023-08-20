class MessageModel {
  String type;
  int id;
  String message;
  String time;
  MessageModel(
      {this.type = '',
      required this.id,
      required this.message,
      required this.time});
}
