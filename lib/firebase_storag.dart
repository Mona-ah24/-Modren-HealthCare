// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> sendImage(String chatRoomId, String senderId, String receiverId) async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile == null) return;

//   final ref = FirebaseStorage.instance
//       .ref()
//       .child("chat_images")
//       .child("${DateTime.now().millisecondsSinceEpoch}.jpg");

//   await ref.putData(await pickedFile.readAsBytes());

//   final imageUrl = await ref.getDownloadURL();

//   final msgRef = FirebaseFirestore.instance
//       .collection("chats")
//       .doc(chatRoomId)
//       .collection("messages")
//       .doc();

//   await msgRef.set({
//     "messageId": msgRef.id,
//     "senderId": senderId,
//     "receiverId": receiverId,
//     "imageUrl": imageUrl,
//     "timestamp": DateTime.now().millisecondsSinceEpoch,
//   });
// }