import 'package:flutter/material.dart';
import 'package:healthcare/CoustemCard.dart';

class HeartDoctors extends StatefulWidget {
  const HeartDoctors({super.key});

  @override
  State<HeartDoctors> createState() => _HeartDoctorsState();
}

class _HeartDoctorsState extends State<HeartDoctors> {
  // Define id5 before using it in CoustemCard
  

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
                  SizedBox(
                    height: 470,
                    child: Column(
                      children: [
                        CoustemCard(
                          id: "id5",
                          title: "Dr.Ahmed Abdollah",
                          subtitle: "Cardiology Consultant",
                          imagepath: "image/12.jpg",
                        ),
                        CoustemCard(
                          id: "id6",
                          title: "Dr.Sami Hassan",
                          subtitle: "Interventional Cardiologist",
                          imagepath: "image/13.jpg",
                        ),
                        CoustemCard(
                          id: "id7",
                          title: "Dr.Omer Badr ",
                          subtitle: "Chest Pain Specialist",
                          imagepath: "image/14.jpg",
                        ),
                        CoustemCard(
                          id: "id8",
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
