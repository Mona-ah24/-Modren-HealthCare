import 'package:flutter/material.dart';
import 'package:healthcare/indexpage.dart';
import 'package:healthcare/sign.dart';
import 'package:healthcare/auth_service.dart';

class Login extends StatefulWidget {
  final String email;
  final String password;

  const Login({super.key, this.email = '', this.password = ''});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // تعبئة تلقائية من صفحة التسجيل
    emailController.text = widget.email;
    passController.text = widget.password;
  }

  // LOGIN FUNCTION
  Future<void> login() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    setState(() {
      isLoading = true;
    });

    try {
      await AuthService().login(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("تم تسجيل الدخول بنجاح")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Indexpage()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      isLoading = false;
    });
  }

  // NAVIGATE TO SIGN UP
  void navigatorToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Sign()),
    );
  }

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 80, right: 80),
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(170),
                    topRight: Radius.circular(170),
                  ),
                  boxShadow: const [
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
                      key: _formKey,
                      child: Column(
                        children: <Widget>[

                          const SizedBox(height: 60),

                          // EMAIL
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'البريد الإلكتروني',
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
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

                          const SizedBox(height: 10),

                          // PASSWORD
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              controller: passController,
                              style: const TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
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
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 100),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "نسيت كلمة المرور؟",
                              style: TextStyle(
                                color: Color.fromARGB(221, 16, 92, 122),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // LOGIN BUTTON
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              await login();
                            },
                      style: ButtonStyle(
                        shadowColor: WidgetStateProperty.all(
                          const Color.fromARGB(221, 16, 92, 122),
                        ),
                        elevation: WidgetStateProperty.all(10),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                color: Color.fromARGB(221, 16, 92, 122),
                              ),
                            ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("ليس لديك حساب؟"),
                        TextButton(
                          onPressed: navigatorToSignUp,
                          child: const Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              color: Color.fromARGB(221, 16, 92, 122),
                            ),
                          ),
                        ),
                      ],
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