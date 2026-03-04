import 'package:flutter/material.dart';
import 'package:healthcare/indexpage.dart';
import 'package:healthcare/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'indexpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String savedEmail = "";
  String savedPass = "";

  Future<void>splash_screen()async{
    Future.delayed(const Duration(seconds: 3), () {
      _checkLogin();
    });

  }
  
  @override
  void initState() {
    splash_screen();
    super.initState();
    
    
  }

  Future<void> _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    savedEmail = prefs.getString('email') ?? "";
    savedPass = prefs.getString('password') ?? "";

    // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (savedEmail.isNotEmpty && savedPass.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Indexpage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar( title: Text("data"),),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
            
          ),
          Positioned(
            top: 0,
            right: 0,
            
            child: Image.asset('image/doc1.png',
                width: 150,
                height: 200,
              fit: BoxFit.contain, 
                )),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('image/doc3.png',
              width: 150,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),


          Center(
            child: Column(
              children: [
              SizedBox(height: 100),
                Image.asset('image/30.png',
                  width: 150,
                  height: 200,
                fit: BoxFit.contain, 
                  ),
                
                SizedBox(height: 100),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
