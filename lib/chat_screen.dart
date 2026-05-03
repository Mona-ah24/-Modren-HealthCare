// screens/chat_screen.dart
import 'package:flutter/material.dart';
// Update the import path to the correct relative location, for example:
import 'uiWidgets.dart';
// import '../widgets/chat_bubble.dart';
// import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  final String doctorId;
  final String doctorName;

  ChatScreen({required this.doctorId, required this.doctorName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({
        "text": text,
        "isMe": true,
      });
    });
    // هنا تقدر تضيف كود إرسال الرسالة إلى Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     widget.doctorName,
      //     style: TextStyle(
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: Colors.teal,
      //   actions: [],
      // ),
       appBar:  AppBar(
        backgroundColor: Colors.teal, // لون واتساب تقريبا
        titleSpacing: 0, // يخلي العنوان قريب من الصورة
        title: Row(
          children: [
            // صورة المستخدم
            CircleAvatar(
              backgroundImage: AssetImage("assets/user.jpg"), 
              radius: 18,
            ),
            SizedBox(width: 8),
            // اسم المستخدم
            Text(
             widget.doctorName,
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
            ),
          ],
        ),
        actions: [
          // أيقونة مكالمة صوتية
          IconButton(
            icon: Icon(
              Icons.call_outlined,
              color: Colors.white,
              ),
            onPressed: () {
              print("Voice call pressed");
            },
          ),

          // أيقونة مكالمة فيديو
          IconButton(
            icon: Icon(
              Icons.videocam_outlined,
              color: Colors.white,
              ),
            onPressed: () {
              print("Video call pressed");
            },
          ),

          // زر القائمة (⋮)
          PopupMenuButton<String>(
            onSelected: (value) {
              print("Selected: $value");
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "عرض جهة الاتصال", child: Text("عرض جهة الاتصال")),
                PopupMenuItem(value: "بحث", child: Text("بحث")),
                PopupMenuItem(value: "كتم الإشعارات", child: Text("كتم الإشعارات")),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("image/new.jpg", fit: BoxFit.cover),
          ),
       Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ChatBubble(text: msg["text"], isMe: msg["isMe"]);
              },
            ),
          ),
          MessageInput(
            onSend: _sendMessage,
            onSendImage: () {
              // Handle image sending here
              print("Image sent");
            },
          ),
        ],
      ),
   ] )
    );
  }
}