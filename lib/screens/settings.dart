import 'dart:ffi';

import 'package:chat/screens/chat/chat_settings.dart';
import 'package:chat/screens/chat/chat_view.dart';
import 'package:chat/screens/notification_setting.dart';
import 'package:chat/screens/privacy_settings.dart';
import 'package:chat/screens/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/contentbuilder/GDG-Bevy-ChapterThumbnail.png",
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "user_name",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      child: Text("Profile settings"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSettingsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(),
                ListTile(
                  title: Text("Privacy"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacySettings(),
                        ));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Notification"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationSettings(),
                        ));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Chats"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatSettings(),
                        ));
                  },
                ),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
