import 'package:flutter/material.dart';

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard({Key? key, required this.msg, required this.time})
      : super(key: key);
  final String msg;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.green[100],
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(time,
                        style:
                            TextStyle(fontSize: 13, color: Colors.grey[600])),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.done_all,
                      size: 15,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
