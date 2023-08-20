import 'package:flutter/material.dart';
import 'package:whatsapp_marketplace/model/chatModel.dart';
import 'package:whatsapp_marketplace/screens/shop_screen.dart';
import 'package:whatsapp_marketplace/widgets/send_message_card.dart';
import 'package:whatsapp_marketplace/widgets/reply_message_card.dart';
import 'package:whatsapp_marketplace/model/MsgModel.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key, required this.chatUser})
      : super(key: key);

  final ChatModel chatUser;

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool sendChatButton = false;
  bool isMarketPlace = false;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //List of messages
    List<MessageModel> messages = [
      MessageModel(
        message: 'This is Admin',
        time: '11:11',
        id: 1,
      ),
      MessageModel(
        message: 'I have added few products in marketplace',
        time: '11:11',
        id: 1,
      ),
      MessageModel(
        message: 'Hi, i am erza',
        time: '11:11',
        id: 5,
      ),
      MessageModel(
        message: 'Hi, i am bob',
        time: '11:11',
        id: 4,
      ),
      MessageModel(
        message: 'Hi, i am user 2',
        time: '11:11',
        id: 2,
      ),
      MessageModel(
        message: 'Hi, i am ashish',
        time: '11:11',
        id: 3,
      ),
      MessageModel(
        message: 'A Whatsapp cloned prototype with a marketplace using flutter',
        time: '11:11',
        id: 1,
      ),
      MessageModel(
        message: 'Made by Ashish Kumar',
        time: '11:11',
        id: 1,
      ),
    ];

    print('USer is ${widget.chatUser.name} and id ${widget.chatUser.id}');
    var uid = widget.chatUser.id;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/whatsapp.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, size: 24),
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 20,
                    child: Icon(
                        widget.chatUser.isGroup ? Icons.groups : Icons.person,
                        color: Colors.white,
                        size: 38),
                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        widget.chatUser.isGroup
                            ? widget.chatUser.groupName
                            : widget.chatUser.name,
                        style: const TextStyle(
                            fontSize: 18.5, fontWeight: FontWeight.bold)),
                    const Text("last seen at 14:00",
                        style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                if (value == "Market" && uid == 1) {
                  setState(() {
                    isMarketPlace = !isMarketPlace;
                    widget.chatUser.isMarket = !widget.chatUser.isMarket;
                  });

                  print(isMarketPlace);
                }
              }, itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "View Contact",
                    child: Text("View Contact"),
                  ),
                  const PopupMenuItem(
                    value: "Media, links, and docs",
                    child: Text("Media, links, and docs"),
                  ),
                  const PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  const PopupMenuItem(
                    value: "Mute notification",
                    child: Text("Mute notification"),
                  ),
                  const PopupMenuItem(
                    value: "Wallpaper",
                    child: Text("Wallpaper"),
                  ),
                  const PopupMenuItem(
                    value: "Market",
                    child: Text("Toggle Marketplace"),
                  ),
                  const PopupMenuItem(
                    value: "More",
                    child: Text("More"),
                  )
                ];
              })
            ],
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WillPopScope(
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            return Container(height: 70);
                          }
                          if (messages[index].id == widget.chatUser.id) {
                            return ChatMessageCard(
                              msg: messages[index].message,
                              time: messages[index].time,
                            );
                          } else {
                            return ReplyMessageCard(
                              msg: messages[index].message,
                              time: messages[index].time,
                            );
                          }
                        })),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 55,
                                child: Card(
                                    margin: const EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextFormField(
                                      controller: _textController,
                                      focusNode: focusNode,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            sendChatButton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendChatButton = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type your message",
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (builder) =>
                                                            bottomSheet());
                                                  },
                                                  icon: const Icon(
                                                      Icons.attach_file)),
                                              widget.chatUser.isGroup &&
                                                      widget.chatUser.isMarket
                                                  ? IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ShopScreen(
                                                                        chatUser:
                                                                            widget.chatUser)));
                                                      },
                                                      icon: const Icon(
                                                          Icons.shop))
                                                  : const Icon(Icons.currency_rupee),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.camera_alt)),
                                            ],
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          prefixIcon: IconButton(
                                            icon: Icon(showEmoji
                                                ? Icons.keyboard
                                                : Icons.emoji_emotions),
                                            onPressed: () {
                                              if (!showEmoji) {
                                                focusNode.unfocus();
                                                focusNode.canRequestFocus =
                                                    false;
                                              }

                                              setState(() {
                                                showEmoji = !showEmoji;
                                              });
                                            },
                                          )),
                                    ))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, right: 2),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.green[400],
                                child: IconButton(
                                    onPressed: () {
                                      if (sendChatButton) {
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);
                                      }
                                    },
                                    icon: Icon(
                                      sendChatButton ? Icons.send : Icons.mic,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onWillPop: () {
              if (showEmoji == true) {
                setState(() {
                  showEmoji = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomSheetIcons(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(width: 40),
                  bottomSheetIcons(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(width: 40),
                  bottomSheetIcons(Icons.insert_photo, Colors.purple, "Gallery")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomSheetIcons(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(width: 40),
                  bottomSheetIcons(Icons.location_pin, Colors.teal, "Location"),
                  const SizedBox(width: 40),
                  bottomSheetIcons(Icons.person, Colors.blue, "Contact")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetIcons(IconData icon, Color bgColor, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 30,
            child: Icon(icon, size: 29, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
