import 'package:chat/models/message.dart';
import 'package:chat/models/user.dart';

class Chat {
  late String name;
  late String photo;
  late List<Message> messages;

  Chat.fromMap(Map<String, dynamic> data) {
    name = data["name"]!;
    photo = data["display_photo"]!;
    messages = (data["messages"] as List<dynamic>)
        .map((e) => Message.fromMap(e))
        .toList();
    messages.sort(
      (b, a) => a.timestamp.compareTo(b.timestamp),
    );
  }
}
