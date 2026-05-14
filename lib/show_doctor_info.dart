import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthcare/info_doctor_card.dart';



class show_doctor_info extends StatefulWidget {
  const show_doctor_info({super.key});

  @override
  State<show_doctor_info> createState() => _show_doctor_infoState();
}

class _show_doctor_infoState extends State<show_doctor_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إدارة الأطباء"),
        backgroundColor: Colors.blueAccent,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('doctors').snapshots(),

        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // error
          if (snapshot.hasError) {
            return const Center(child: Text("حدث خطأ أثناء جلب البيانات"));
          }

          // empty
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("لا توجد بيانات حالياً"));
          }

          var doctors = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),

            itemCount: doctors.length,

            itemBuilder: (context, index) {
              var doc = doctors[index];

              return info_doctor_card(
                doc: doc,

              );
            },
          );
        },
      ),
    );
  }



  // =========================
  // TextField Widget
  // =========================

  Widget _buildField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        labelText: label,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
