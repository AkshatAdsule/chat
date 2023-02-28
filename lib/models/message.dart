import 'package:chat/models/user.dart';

enum MessageType { text, image }

class Message {
  final MessageType messageType;
  final String contents;
  final User sender;

  const Message({
    required this.messageType,
    required this.contents,
    required this.sender,
  });
}
