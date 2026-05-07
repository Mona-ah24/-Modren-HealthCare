import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackAppointmentScreen extends StatelessWidget {
  final String appointmentId; // نمرر الـ ID الخاص بالحجز (مثلاً 'uid_id8')

  const TrackAppointmentScreen({Key? key, required this.appointmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تتبع حالة الحجز'),
        backgroundColor: const Color.fromARGB(255, 9, 108, 126),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        // نستمع لوثيقة هذا الحجز بعينه لمعرفة حالته اللحظية
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .doc(appointmentId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('لم يتم العثور على بيانات الحجز.'));
          }

          var appointment = snapshot.data!.data() as Map<String, dynamic>;
          String status = appointment['status'] ?? 'pending';
          String doctorName = appointment['doctorName'] ?? 'الطبيب';

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'حجزك عند $doctorName',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 9, 108, 126)),
                ),
                const SizedBox(height: 40),
                
                // شريط تتبع الحالات
                _buildStep(
                  title: 'تم إرسال الطلب',
                  subtitle: 'بانتظار مراجعة العيادة',
                  isActive: true, // دائماً نشط لأن الحجز تم بالفعل
                  isCompleted: status == 'accepted' || status == 'completed',
                ),
                _buildLine(isCompleted: status == 'accepted' || status == 'completed'),
                _buildStep(
                  title: 'تم قبول الحجز',
                  subtitle: 'تم تأكيد موعدك بنجاح',
                  isActive: status == 'accepted' || status == 'completed',
                  isCompleted: status == 'completed',
                ),
                _buildLine(isCompleted: status == 'completed'),
                _buildStep(
                  title: 'اكتملت الزيارة',
                  subtitle: 'شكراً لزيارتك لنا نتمنى لك الشفاء',
                  isActive: status == 'completed',
                  isCompleted: status == 'completed',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ويدجت لبناء الخطوات البرمجية بشكل مرئي
  Widget _buildStep({required String title, required String subtitle, required bool isActive, required bool isCompleted}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: isCompleted 
              ? Colors.green 
              : (isActive ? const Color.fromARGB(255, 9, 108, 126) : Colors.grey[300]),
          child: Icon(
            isCompleted ? Icons.check : Icons.circle,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        )
      ],
    );
  }
  // ويدجت لبناء الخط الواصل بين الخطوات
  Widget _buildLine({required bool isCompleted}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 15),
      height: 40,
      width: 3,
      color: isCompleted ? Colors.green : Colors.grey[300],
    );
  }
}