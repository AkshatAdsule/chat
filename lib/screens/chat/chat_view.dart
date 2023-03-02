import 'package:chat/models/Chat.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/user.dart';
import 'package:chat/services/user_service.dart';
import 'package:chat/widgets/chat/image_message.dart';
import 'package:chat/widgets/chat/text_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewPage extends StatefulWidget {
  final int id;
  final Chat intialChat;
  final String chatId;
  const ChatViewPage({
    super.key,
    required this.id,
    required this.intialChat,
    required this.chatId,
  });

  @override
  State<ChatViewPage> createState() => _ChatViewPageState();
}

class _ChatViewPageState extends State<ChatViewPage> {
  late Chat _chat;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _chat = widget.intialChat;
    setState(() {
      _chat.messages.sort(
        (b, a) => a.timestamp.compareTo(b.timestamp),
      );
    });

    FirebaseFirestore.instance
        .doc("/chats/${widget.chatId}")
        .snapshots()
        .listen((event) {
      setState(() {
        _chat = Chat.fromMap(event.data()!);
      });
    });
  }

  void _sendTextMessage() {
    User currentUser = UserService.getInstance().getCurrentUser()!;
    _chat.messages.add(
      Message(
        messageType: MessageType.text,
        contents: _messageController.text,
        sender: currentUser,
        timestamp: Timestamp.now(),
      ),
    );
    List<Map<String, dynamic>> messagesJson =
        _chat.messages.map((e) => e.toJson()).toList();
    FirebaseFirestore.instance
        .doc("/chats/${widget.chatId}")
        .update({"messages": messagesJson});
    _messageController.clear();
    _scrollController.jumpTo(_scrollController.position.minScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: "__chat_icon${widget.id}",
              child: CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                foregroundImage: NetworkImage(
                  _chat.photo,
                ),
                radius: 17.5,
              ),
            ),
            const SizedBox(
              width: 7.5,
            ),
            Hero(
              transitionOnUserGestures: true,
              tag: "__chat_name${widget.id}",
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  _chat.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                // flex: 14,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: _chat.messages.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Message message = _chat.messages[index];
                      if (message.messageType == MessageType.text) {
                        return TextMessage(
                          message: message,
                        );
                      } else if (message.messageType == MessageType.image) {
                        return ImageMessage(message: message);
                      }
                    },
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1.5,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: Row(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) =>
                                Theme.of(context).colorScheme.background,
                          ),
                          iconColor: MaterialStateColor.resolveWith(
                            (states) =>
                                Theme.of(context).colorScheme.onBackground,
                          )),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_photo_alternate,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Send a message...",
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          suffixIcon: InkWell(
                            radius: 10,
                            onTap: () {
                              _sendTextMessage();
                            },
                            child: Icon(
                              Icons.send,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
