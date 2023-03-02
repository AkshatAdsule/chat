import 'package:flutter/material.dart';

class ChatSettings extends StatefulWidget {
  const ChatSettings({super.key});

  @override
  State<ChatSettings> createState() => _ChatSettingsState();
}

class _ChatSettingsState extends State<ChatSettings> {
  @override
  bool MasterEnable = true;
  bool PreviewEnable = true;
  bool GroupchatEnable = true;
  bool VibrationEnable = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(),
            ListTile(
              title: Text("All Notification"),
              trailing: Switch(
                value: MasterEnable,
                onChanged: (value) {
                  setState(() {
                    MasterEnable = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Group-Chat Notification"),
              trailing: Switch(
                value: GroupchatEnable,
                onChanged: (value) {
                  setState(() {
                    GroupchatEnable = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Show Previews"),
              trailing: Switch(
                value: PreviewEnable,
                onChanged: (value) {
                  setState(() {
                    PreviewEnable = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Delete All Chat"),
              onTap: () {
                showAlertDialog(context);
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Delete"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete All Chat"),
    content: Text("Would you like to delete all chat history?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
