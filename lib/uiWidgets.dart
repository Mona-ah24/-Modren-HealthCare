// widgets/chat_bubble.dart
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  final bool isMe;

  const ChatBubble({super.key, this.text, this.imageUrl, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (text != null) Text(text!),
            if (imageUrl != null)
              Image.network(imageUrl!, width: 200, height: 200, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}

// widgets/message_input.dart
// import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final Function(String) onSend;
  final Function() onSendImage;

  const MessageInput({super.key, required this.onSend, required this.onSendImage});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         IconButton(
          icon: Icon(Icons.image),
          onPressed: widget.onSendImage,
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 77, 184, 178),
              hintText: "Write massage",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        CircleAvatar(
          child: IconButton(
            icon: Icon(Icons.send),
            color: Colors.teal,
            onPressed: () {
              widget.onSend(controller.text);
              controller.clear();
            },
          ),
        ),
      ],
    );
  }
}