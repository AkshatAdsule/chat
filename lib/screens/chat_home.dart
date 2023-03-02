import 'package:chat/screens/chat_view.dart';
import 'package:chat/screens/create_chat.dart';
import 'package:chat/screens/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateChatScreen(),
              ))
        },
        label: const Text("New Chat"),
        icon: const Icon(Icons.chat_bubble_outline),
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alternate_email),
            label: "Mentions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, i) => InkWell(
            // behavior: HitTestBehavior.translucent,
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatViewPage(id: i),
                  ))
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Hero(
                    tag: "__chat_icon$i",
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).highlightColor,
                      foregroundImage: const NetworkImage(
                        "https://www.gannett-cdn.com/presto/2019/04/26/PBIN/df7d1316-cf0c-43c6-8062-0fa715b43282-GettyImages-935244690.jpg?width=1200&disable=upscale&format=pjpg&auto=webp",
                      ),
                      radius: 32.5,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Hero(
                            transitionOnUserGestures: true,
                            tag: "__chat_name$i",
                            child: const Material(
                              type: MaterialType.transparency,
                              child: Text(
                                "CHE 002A",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Badge(
                            label: const Text("10"),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            textColor: Theme.of(context).colorScheme.onPrimary,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "Steven: Recent Message...",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
