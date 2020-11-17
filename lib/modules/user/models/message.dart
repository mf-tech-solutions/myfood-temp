class Message {
  MessageType type;
  String text;

  Message({this.type, this.text});
}

enum MessageType {
  SUCCESS,
  INFO,
  ERROR,
}
