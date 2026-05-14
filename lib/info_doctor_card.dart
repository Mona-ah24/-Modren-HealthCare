import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class info_doctor_card extends StatelessWidget {
  final DocumentSnapshot doc;

  

  const info_doctor_card({
    super.key,
    required this.doc,
    
  });

  String safeGet(String field) {
    try {
      var data = doc.data() as Map<String, dynamic>;

      if (data.containsKey(field)) {
        return data[field]?.toString() ?? "";
      }

      return "-";
    } catch (e) {
      return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,

      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  safeGet('name'),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                CircleAvatar(child: Icon(Icons.person)),
              ],
            ),

            SizedBox(height: 15),

            Text("ID : ${safeGet('id')}"),

            SizedBox(height: 8),

            Text("Specialty : ${safeGet('specialty')}"),

            SizedBox(height: 8),

            Text("Department : ${safeGet('department')}"),

            SizedBox(height: 8),

            Text("Day : ${safeGet('day')}"),

            SizedBox(height: 8),

            Text("Period : ${safeGet('period')}"),

            SizedBox(height: 15),

            
          ],
        ),
      ),
    );
  }
}
