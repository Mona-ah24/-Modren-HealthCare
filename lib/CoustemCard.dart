import 'package:flutter/material.dart';
import 'package:healthcare/chat_screen.dart';
import 'package:healthcare/success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoustemCard extends StatefulWidget {
  final String id;
  final String title;
  final String imagepath;
  final String subtitle;

  const CoustemCard({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagepath,
  });

  @override
  State<CoustemCard> createState() => _CoustemCardState();
}

class _CoustemCardState extends State<CoustemCard> {
  late List<Map<String, String>> doctors;

  @override
  // void initState() {
  //   super.initState();
  //   doctors = [
  //     {"doctorId": "d1", "doctorName": widget.title},
  //     {"doctorId": "d2", "doctorName": "Dr. Sara"},
  //   ];
  // }

  void navigateToChat(Map<String, String> doctor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatScreen(
          doctorId: widget.id,
          doctorName:widget.title,
        ),
      ),
    );
  }
  bool orderPlaced = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 230, 237, 238),
      elevation: 2.1,
      child: ListTile(
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 9, 108, 126),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: Image.asset(
            widget.imagepath,
            fit: BoxFit.contain,
          ).image,
        ),
        trailing: orderPlaced
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.message, color: Color.fromARGB(255, 39, 146, 150),
                      size: 20,
                    ),
                    onPressed: () {
                      // Pass the first doctor for demonstration; adjust as needed
                      navigateToChat({"doctorId": widget.id, "doctorName": widget.title});
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 39, 146, 150),size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        orderPlaced = false;
                      });
                    },
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: orderPlaced
                    ? null
                    : () async {
                        try {
                          setState(() {
                            orderPlaced = true;
                          });

                          final uid = FirebaseAuth.instance.currentUser!.uid;

                          // بيانات المريض
                          final userDoc = await FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .get();

                          final patientData = userDoc.data();

                          // بيانات الدكتور
                          final doctorDoc = await FirebaseFirestore.instance
                              .collection('doctors')
                              .doc(widget.id)
                              .get();

                          final doctorData = doctorDoc.data();

                          // إنشاء الموعد
                          final docRef = FirebaseFirestore.instance
                              .collection('appointments')
                              .doc('${uid}_${widget.id}');

                          final doc = await docRef.get();

                          if (!doc.exists) {
                            await docRef.set({
                              'doctorId': widget.id,
                              'patientId': uid,
                              'patientName': patientData?['name'] ?? '',
                              'doctorName': doctorData?['name'] ?? '',
                              'status': 'pending',
                              'createdAt': FieldValue.serverTimestamp(),
                            });
                          }

                          if (!mounted) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => success()),
                          );
                        } catch (e) {
                          print(e);

                          setState(() {
                            orderPlaced = false;
                          });

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Error: $e')));
                        }
                      },

                child: Text(
                  orderPlaced ? "Booked" : "Get",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 9, 108, 126),
                  ),
                ),
              )
      ),
    );
  }
}
