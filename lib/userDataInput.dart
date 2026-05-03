import 'package:flutter/material.dart';
import 'package:healthcare/sqlDatabase.dart';
import 'package:healthcare/userModel.dart';

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
        name: _nameController.text,
        phone: _phoneController.text,
        age: int.parse(_ageController.text),
        gender: _gender!,
        email: _emailController.text,
      );

      await DatabaseHelper.instance.insertUser(user);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ البيانات بنجاح ✅')),
      );

      _nameController.clear();
      _phoneController.clear();
      _ageController.clear();
      _emailController.clear();
      setState(() => _gender = null);

    }
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'الاسم مطلوب';
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) return 'حروف فقط';
                  if (value.length < 3) return '3 أحرف على الأقل';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'الهاتف مطلوب';
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) return 'أرقام فقط';
                  if (value.length < 10) return '10 أرقام على الأقل';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'العمر مطلوب';
                  final age = int.tryParse(value);
                  if (age == null || age < 1 || age > 120) return 'بين 1 و 120';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _gender,
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                ],
                onChanged: (val) => setState(() => _gender = val),
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) => value == null ? 'اختر الجنس' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'البريد مطلوب';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'صيغة غير صحيحة';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submitForm,
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}