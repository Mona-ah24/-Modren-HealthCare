import 'package:flutter/material.dart';
import 'package:healthcare/CoustemCard.dart';

class HeartDoctors extends StatefulWidget {
  const HeartDoctors({super.key});

  @override
  State<HeartDoctors> createState() => _HeartDoctorsState();
}

class _HeartDoctorsState extends State<HeartDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset("image/new.jpg", fit: BoxFit.cover),
              ),
              Column(
                children: [
                  Positioned(
                    child: Image.asset('image/heart.png', width: 80, height: 80),
                  ),
                  Text(
                    'Heart Clinic',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 470,
                    child: Column(
                      children: [
                        CoustemCard(
                          title: "Dr.Ahmed Abdollah",
                          subtitle: "Cardiology Consultant",
                          imagepath: "image/12.jpg",
                        ),
                        CoustemCard(
                          title: "Dr.Sami Hassan",
                          subtitle: "Interventional Cardiologist",
                          imagepath: "image/13.jpg",
                        ),
                        CoustemCard(
                          title: "Dr.Omer Badr ",
                          subtitle: "Chest Pain Specialist",
                          imagepath: "image/14.jpg",
                        ),
                        CoustemCard(
                          title: "Dr.Zainab Ahmed",
                          subtitle: "Valve Disease Expert",
                          imagepath: "image/16.jpg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
