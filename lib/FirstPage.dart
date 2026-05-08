import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare/indexpage.dart';
import 'package:healthcare/login.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      _checkLogin();
    });
  }

  void _checkLogin() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // المستخدم مسجل دخول
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Indexpage()),
      );
    } else {
      // المستخدم غير مسجل
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'image/doc1.png',
              width: 150,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'image/doc3.png',
              width: 150,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),

          Center(
            child: Column(
              children: [
                const SizedBox(height: 100),

                Image.asset('image/30.png', width: 150, height: 200),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
