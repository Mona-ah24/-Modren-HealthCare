import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare/TrackAppointmentScreen.dart';
import 'HomePage.dart';


class UserFormPage extends StatefulWidget {
  final String id;
  const UserFormPage({
    super.key,
    required this.id,
  
  });
  

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  String? _gender;

  // هذا الكود يوضع داخل دالة الحجز في تطبيق الموبايل
// Future<void> bookAppointment(String selectedDoctorId, String patientName) async {
//   try {
//     await FirebaseFirestore.instance.collection('appointments').add({
//       // 1. أهم حقل: المعرف الخاص بالطبيب الذي اختاره المريض
//       'doctorId': selectedDoctorId, 
      
//       // 2. بيانات المريض
//       'patientName': patientName,
//       'patientId': FirebaseAuth.instance.currentUser!.uid,
      
//       // 3. حالة الحجز الافتراضية
//       'status': 'pending',
      
//       // 4. وقت الحجز (ضروري للترتيب الذي وضعناه في الويب)
//       'createdAt': FieldValue.serverTimestamp(), 
//     });
    
//     print("تم الحجز بنجاح!");
//   } catch (e) {
//     print("خطأ في الحجز: $e");
//   }
// }
  Future<void> _submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        final userData = {
          'name': _nameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'age': int.parse(_ageController.text.trim()),
          'gender': _gender,
          'email': _emailController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        };

        // id للـ user (لو مستخدم مسجل)
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please login first'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        final uid = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set(userData);


        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حفظ البيانات بنجاح في Firebase ✅'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        // تنظيف الحقول
        _nameController.clear();
        _phoneController.clear();
        _ageController.clear();
        _emailController.clear();

        setState(() {
          _gender = null;
        });
        
        // الانتقال للصفحة الرئيسية
        Future.delayed(const Duration(seconds: 1), () {
          if (!mounted) return;

          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (_) => const  TrackAppointmentScreen(appointmentId: '${uid}_${widget.id}')),
          // );
        });
      }
    } catch (e) {
      debugPrint("Firebase Error: $e");
    }
  }

   @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Form'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // NAME
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الاسم مطلوب';
                  }
                  if (value.length < 3) {
                    return '3 أحرف على الأقل';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // PHONE
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الهاتف مطلوب';
                  }
                  if (value.length < 9) {
                    return '9 أرقام على الأقل';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // AGE
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'العمر مطلوب';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age < 1 || age > 120) {
                    return 'عمر غير صحيح';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // GENDER
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                ],
                onChanged: (val) {
                  setState(() {
                    _gender = val;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'اختر الجنس';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // EMAIL
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'البريد مطلوب';
                  }
                  if (!value.contains('@')) {
                    return 'بريد غير صحيح';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // SUBMIT BUTTON
              ElevatedButton(
                onPressed: 
                    () async {
                        try {
                          _submitForm();
                          final uid = FirebaseAuth.instance.currentUser!.uid;

                          // بيانات المريض
                          // final userDoc = await FirebaseFirestore.instance
                          //     .collection('users')
                          //     .doc(uid)
                          //     .get();

                          // final patientData = userDoc.data();

                          // // بيانات الدكتور
                          // final doctorDoc = await FirebaseFirestore.instance
                          //     .collection('doctors')
                          //     .doc(widget.id)
                          //     .get();

                          // final doctorData = doctorDoc.data();

                          // إنشاء الموعد
                          // final docRef = FirebaseFirestore.instance
                          //     .collection('appointments')
                          //     .doc('${uid}_${widget.id}');

                          // final doc = await docRef.get();

                          // if (!doc.exists) {
                          //   await docRef.set({
                          //     'doctorId': widget.id,
                          //     'patientId': uid,
                          //     'patientName': patientData?['name'] ?? '',
                          //     'doctorName': doctorData?['name'] ?? '',
                          //     'status': 'pending',
                          //     'createdAt': FieldValue.serverTimestamp(),
                          //   });
                          // }

                          // if (!mounted) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>TrackAppointmentScreen(appointmentId: '${uid}_${widget.id}')),
                          );
                        } catch (e) {
                          print(e);


                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Error: $e')));
                          
                        }
                      },

                child: Text(
                   "Get",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 9, 108, 126),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}