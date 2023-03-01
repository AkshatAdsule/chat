import 'dart:typed_data';

import 'package:chat/widgets/common/circle_image_picker.dart';
import 'package:flutter/material.dart';

class CreateChatScreen extends StatefulWidget {
  const CreateChatScreen({super.key});

  @override
  State<CreateChatScreen> createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Chat"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleImagePicker(
                  onSelect: (Uint8List imageBytes) {
                    print(imageBytes.length);
                  },
                  radius: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                const Expanded(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Chat name",
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
                title: const Text("Make Public?"),
                subtitle: const Text(
                  "Make this chat public so others can search and join",
                  style: TextStyle(fontSize: 11),
                ),
                trailing: Switch(
                  onChanged: (value) {},
                  value: true,
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text("Add Members"),
                    Icon(Icons.arrow_forward)
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
