import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';


class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

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

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
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
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
