import 'package:chat/models/message.dart';
import 'package:chat/models/user.dart';
import 'package:chat/widgets/chat/image_message.dart';
import 'package:chat/widgets/chat/text_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatViewPage extends StatefulWidget {
  final int id;

  const ChatViewPage({super.key, required this.id});

  @override
  State<ChatViewPage> createState() => _ChatViewPageState();
}

class _ChatViewPageState extends State<ChatViewPage> {
  final List<Message> messages = const [
    Message(
      messageType: MessageType.text,
      contents:
          "Hello, World! this is a very very very very very very very very very very very very very very very very long message",
      sender: User(
        firstName: "Steve",
        lastName: "Holmes",
        profilePhoto:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      ),
    ),
    Message(
      messageType: MessageType.text,
      contents: "Hello, World!",
      sender: User(
        firstName: "Micheal",
        lastName: "Holmes",
        profilePhoto:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      ),
    ),
    Message(
      messageType: MessageType.text,
      contents: "Hello, World!",
      sender: User(
        firstName: "Jan",
        lastName: "Holmes",
        profilePhoto:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      ),
    ),
    Message(
      messageType: MessageType.text,
      contents: "Hello, World!",
      sender: User(
          firstName: "Ed",
          lastName: "Holmes",
          profilePhoto:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
    ),
    Message(
      messageType: MessageType.image,
      contents:
          "https://upload.wikimedia.org/wikipedia/commons/e/e1/Chemicals_in_flasks.jpg",
      sender: User(
        firstName: "5",
        lastName: "Holmes",
        profilePhoto:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      ),
    ),
  ];

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
                foregroundImage: const NetworkImage(
                  "https://www.gannett-cdn.com/presto/2019/04/26/PBIN/df7d1316-cf0c-43c6-8062-0fa715b43282-GettyImages-935244690.jpg?width=1200&disable=upscale&format=pjpg&auto=webp",
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
              child: const Material(
                type: MaterialType.transparency,
                child: Text(
                  "CHE 002A",
                  style: TextStyle(fontSize: 16),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              // flex: 14,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                child: ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: messages.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Message message = messages[index];
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
                          (states) => Theme.of(context).colorScheme.background,
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
                          onTap: () {},
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
    );
  }
}
