import 'dart:typed_data';

import 'package:chat/screens/chat/chat_home.dart';
import 'package:chat/screens/chat/chat_view.dart';
import 'package:chat/widgets/common/circle_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  //var db = FirebaseFirestore.instance;
  TextEditingController _username_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Profile Settings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 30),
        child: Column(
          children: [
            CircleImagePicker(
              onSelect: (Uint8List image) {},
              radius: 70,
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(),
            // ),
            Expanded(
              flex: 3,
              child: Column(children: [
                const SizedBox(height: 40),
                TextField(
                  controller: _username_controller,
                  decoration: InputDecoration(
                    labelText: "User name",
                    labelStyle: TextStyle(
                      fontSize: 22,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Divider(),
                TextField(
                  controller: _username_controller,
                  decoration: InputDecoration(
                    labelText: "First name",
                    labelStyle: TextStyle(
                      fontSize: 22,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Divider(),
                TextField(
                  controller: _username_controller,
                  decoration: InputDecoration(
                    labelText: "Last name",
                    labelStyle: TextStyle(
                      fontSize: 22,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ]),
            ),
            FilledButton(
              onPressed: () {
                //cloud firestore

                // var uid = 1;
                // db.collection("users").doc(uid).set(username));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatHomeScreen()));
              },
              child: Row(children: [
                Expanded(child: Container()),
                Text("Done"),
                Expanded(child: Container())
              ]),
              // style: ButtonStyle(
              //   padding:
              //       MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
              //   foregroundColor: MaterialStateProperty.all<Color>(
              //       Theme.of(context).colorScheme.secondary),
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       side: BorderSide(
              //         color: Theme.of(context).colorScheme.secondary,
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
