import 'package:flutter/material.dart';
import 'package:healthcare/CoustemCard.dart';

class BrainDoctors extends StatefulWidget {
  const BrainDoctors({super.key});

  @override
  State<BrainDoctors> createState() => _BrainDoctorsState();
}

class _BrainDoctorsState extends State<BrainDoctors> {
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
                    child: Image.asset('image/brain.png', width: 80, height: 80),
                  ),
                  Text(
                    'Neurology Clinic',
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
                          title: "Dr.Ali Nasser",
                          subtitle: "Brain & Nerve Specialist",
                          imagepath: "image/7.jpg",
                        ),
                        CoustemCard(
                          title: "Dr.Mazen Ali",
                          subtitle: "Neurology Consultant",
                          imagepath: "image/9.jpg",
                        ),
                        CoustemCard(
                          title: "Dr.Neda Rashed",
                          subtitle: "Nerve Disorder Expert",
                          imagepath: "image/10.jpg",
                        ),
                        CoustemCard(
                          title: "Dr.Noor Ahmed ",
                          subtitle: "Stroke Specialist",
                          imagepath: "image/11.jpg",
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
