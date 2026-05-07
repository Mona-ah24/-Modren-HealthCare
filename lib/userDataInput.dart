// import 'package:flutter/material.dart';
// import 'package:healthcare/sqlDatabase.dart';
// import 'package:healthcare/userModel.dart';

// class UserFormPage extends StatefulWidget {
//   const UserFormPage({super.key});

//   @override
//   State<UserFormPage> createState() => _UserFormPageState();
// }

// class _UserFormPageState extends State<UserFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _emailController = TextEditingController();
//   String? _gender;

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       final user = UserModel(
//         name: _nameController.text,
//         phone: _phoneController.text,
//         age: int.parse(_ageController.text),
//         gender: _gender!,
//         email: _emailController.text,
//       );

//       await DatabaseHelper.instance.insertUser(user);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('تم حفظ البيانات بنجاح ✅')),
//       );

//       _nameController.clear();
//       _phoneController.clear();
//       _ageController.clear();
//       _emailController.clear();
//       setState(() => _gender = null);

//     }
//     print('object');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Form')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return 'الاسم مطلوب';
//                   if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) return 'حروف فقط';
//                   if (value.length < 3) return '3 أحرف على الأقل';
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: const InputDecoration(labelText: 'Phone'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return 'الهاتف مطلوب';
//                   if (!RegExp(r'^[0-9]+$').hasMatch(value)) return 'أرقام فقط';
//                   if (value.length < 10) return '10 أرقام على الأقل';
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _ageController,
//                 decoration: const InputDecoration(labelText: 'Age'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return 'العمر مطلوب';
//                   final age = int.tryParse(value);
//                   if (age == null || age < 1 || age > 120) return 'بين 1 و 120';
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 12),
//               DropdownButtonFormField<String>(
//                 value: _gender,
//                 items: const [
//                   DropdownMenuItem(value: 'Male', child: Text('Male')),
//                   DropdownMenuItem(value: 'Female', child: Text('Female')),
//                 ],
//                 onChanged: (val) => setState(() => _gender = val),
//                 decoration: const InputDecoration(labelText: 'Gender'),
//                 validator: (value) => value == null ? 'اختر الجنس' : null,
//               ),
//               const SizedBox(height: 12),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return 'البريد مطلوب';
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'صيغة غير صحيحة';
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(onPressed: _submitForm,
//                   child: const Text('Submit')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorsListMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("قائمة الأطباء")),
      // استخدمنا StreamBuilder ليكون الاتصال "لحظي"
      body: StreamBuilder<QuerySnapshot>(
        // نحدد المجموعة التي نراقبها (نفس الاسم الذي استخدمناه في الويب)
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .orderBy('addedAt', descending: true) // ترتيب حسب الأحدث
            .snapshots(),
        builder: (context, snapshot) {
          // 1. حالة التحميل
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // 2. حالة وجود خطأ
          if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ في جلب البيانات"));
          }

          // 3. إذا كانت القائمة فارغة
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("لا توجد بيانات حالياً، ارفع ملف الإكسل من الويب"));
          }

          // 4. عرض البيانات في قائمة (ListView)
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doctor = snapshot.data!.docs[index];
              
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(doctor['name'] ?? 'بدون اسم'),
                  subtitle: Text(doctor['specialty'] ?? 'بدون تخصص'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}