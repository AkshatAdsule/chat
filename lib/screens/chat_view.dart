import 'package:flutter/material.dart';

class ChatViewPage extends StatelessWidget {
  int id;
  ChatViewPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: "__chat_icon$id",
              child: CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                foregroundImage: const NetworkImage(
                  "https://www.gannett-cdn.com/presto/2019/04/26/PBIN/df7d1316-cf0c-43c6-8062-0fa715b43282-GettyImages-935244690.jpg?width=1200&disable=upscale&format=pjpg&auto=webp",
                ),
                radius: 15,
              ),
            ),
            Hero(
              transitionOnUserGestures: true,
              tag: "__chat_name$id",
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
      ),
    );
  }
}
