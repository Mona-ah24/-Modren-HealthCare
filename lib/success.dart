import 'package:flutter/material.dart';
import 'package:healthcare/userDataInput.dart';


class success extends StatelessWidget {
  const success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text("Successful", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("image/new.jpg", fit: BoxFit.cover),
          ),
          Center(
            child: Container(
              width: 280,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                  ),
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Image.asset('image/background.png', width: 140, height: 140),
                  Text(
                    'Well Done!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 19),
                  Text(
                    "Your doctor has been booked",
                    style: TextStyle(color: Colors.teal),
                  ),
                  Text(
                    "We wish you a speedy recovery",
                    style: TextStyle(color: Colors.teal),
                  ),
                  Text(
                    "Thank you for trusting us",
                    style: TextStyle(color: Colors.teal),
                  ),
                  Text(
                    "We hope to be at your best",
                    style: TextStyle(color: Colors.teal),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const UserFormPage(),
    ),
  );
},
                    child: Text(
                      'User Data',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
