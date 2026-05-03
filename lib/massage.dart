class Message {
  final String messageId;
  final String senderId;
  final String receiverId;
  final String? text;
  final String? imageUrl;
  final DateTime timestamp;

  Message({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    this.text,
    this.imageUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'imageUrl': imageUrl,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageId: map['messageId'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      text: map['text'],
      imageUrl: map['imageUrl'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
    );
  }
}