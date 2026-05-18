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

        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('يرجى تسجيل الدخول أولاً'),
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

        _nameController.clear();
        _phoneController.clear();
        _ageController.clear();
        _emailController.clear();

        setState(() {
          _gender = null;
        });

        Future.delayed(const Duration(seconds: 1), () {
          if (!mounted) return;
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
        title: const Text('نموذج المستخدم'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'الاسم'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الاسم مطلوب';
                  }
                  if (value.length < 3) {
                    return 'يجب أن يكون 3 أحرف على الأقل';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'رقم الهاتف مطلوب';
                  }
                  if (value.length < 9) {
                    return 'يجب أن يحتوي على 9 أرقام على الأقل';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'العمر'),
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

              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: 'الجنس'),
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('ذكر')),
                  DropdownMenuItem(value: 'Female', child: Text('أنثى')),
                ],
                onChanged: (val) {
                  setState(() {
                    _gender = val;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'يرجى اختيار الجنس';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'البريد الإلكتروني مطلوب';
                  }
                  if (!value.contains('@')) {
                    return 'بريد إلكتروني غير صحيح';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  try {
                    _submitForm();

                    final uid = FirebaseAuth.instance.currentUser!.uid;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackAppointmentScreen(
                          appointmentId: '${uid}_${widget.id}',
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('خطأ: $e')),
                    );
                  }
                },
                child: const Text(
                  "إرسال",
                  style: TextStyle(
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