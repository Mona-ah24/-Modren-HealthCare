import 'package:flutter/material.dart';
import 'package:healthcare/CoustemCard.dart';

class Toothdocturs extends StatefulWidget {
  const Toothdocturs({super.key});

  @override
  State<Toothdocturs> createState() => _ToothdoctursState();
}

class _ToothdoctursState extends State<Toothdocturs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset("image/new.jpg", fit: BoxFit.cover),
            ),
            Column(
              children: [
                Positioned(
                  child: Image.asset('image/tooth.png', width: 80, height: 80),
                ),
                Text(
                  'Dental Clinic',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  // height: 350,
                  child: Column(
                    children: [
                      CoustemCard(
                        title: "Dr.Hadi Yaser",
                        subtitle: "General Dentist",
                        imagepath: "image/15.jpg",
                      ),
        
                      CoustemCard(
                        title: "Dr.Mona Ahmed",
                        subtitle: "Cosmetic Dentistry Expert",
                        imagepath: "image/17.jpg",
                      ),
                      CoustemCard(
                        title: "Dr.Saleh Salem",
                        subtitle: "Oral Surgeon",
                        imagepath: "image/18.jpg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
