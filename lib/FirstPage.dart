import 'package:flutter/material.dart';
import 'package:healthcare/login.dart';

//import 'indexpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  Future<void>splash_screen()async{
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });

  }
  
  @override
  void initState() {
    splash_screen();
    super.initState();

    
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
