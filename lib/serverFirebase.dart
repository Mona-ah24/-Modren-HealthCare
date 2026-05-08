// services/firebase_chat_service.dart
import "package:cloud_firestore/cloud_firestore.dart";
// import '../models/message.dart';
import 'massage.dart';

class FirebaseChatService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Message>> getMessages(String chatRoomId) {
    return _db.collection("chats/$chatRoomId/messages")
        .orderBy("timestamp")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList()
    );
  }

  Future<void> sendMessage(String chatRoomId, Message message) async {
    await _db.collection("chats/$chatRoomId/messages")
        .doc(message.messageId)
        .set(message.toMap());
  }
}