import 'package:flutter/material.dart';
import 'package:healthcare/login.dart';
import 'auth_service.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var isLoading = false;

  bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool isStrongPassword(String password) {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$')
        .hasMatch(password);
  }

  Future<void> signUp() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    setState(() {
      isLoading = true;
    });

    try {
      await AuthService().signUp(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم إنشاء الحساب بنجاح")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Login(
            email: emailController.text.trim(),
            password: passController.text.trim(),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 80),
            child: Image.asset("image/30.png", width: 200, height: 200),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(170),
                    topRight: Radius.circular(170),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[

                          SizedBox(height: 60),

                          // NAME
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              controller: nameController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'الاسم',
                                hintText: 'أدخل اسمك',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'أدخل اسم صحيح';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: 10),

                          // EMAIL
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              controller: emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'البريد الإلكتروني',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                    ).hasMatch(value)) {
                                  return 'أدخل بريد إلكتروني صحيح';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: 10),

                          // PASSWORD
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              controller: passController,
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'أدخل كلمة مرور صحيحة';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: 50),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      style: ButtonStyle(
                        shadowColor: WidgetStateProperty.all(
                          const Color.fromARGB(221, 16, 92, 122),
                        ),
                        elevation: WidgetStateProperty.all(10),
                      ),
                      onPressed: () async {
                        await signUp();
                      },
                      child: Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          color: const Color.fromARGB(221, 16, 92, 122),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}