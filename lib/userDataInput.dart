import 'package:flutter/material.dart';
import 'package:healthcare/sqlDatabase.dart';
import 'package:healthcare/userModel.dart';
import 'package:healthcare/HomePage.dart';

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
    if (_formKey.currentState!.validate()) {

      final user = UserModel(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        age: int.parse(_ageController.text.trim()),
        gender: _gender!,
        email: _emailController.text.trim(),
      );

      await DatabaseHelper.instance.insertUser(user);

      if (!mounted) return;

      // SnackBar نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حفظ البيانات بنجاح ✅'),
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

      // الانتقال للـ Home مع استبدال الصفحة
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      });
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
        automaticallyImplyLeading: false, //  يشيل السهم
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
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'حروف فقط';
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
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'أرقام فقط';
                  }
                  if (value.length < 10) {
                    return '10 أرقام على الأقل';
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
                    return 'بين 1 و 120';
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
                  DropdownMenuItem(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Female'),
                  ),
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
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'صيغة غير صحيحة';
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