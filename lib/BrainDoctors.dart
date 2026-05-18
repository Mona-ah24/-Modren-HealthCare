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
                child: Image.asset(
                  "image/new.jpg",
                  fit: BoxFit.cover,
                ),
              ),

              Column(
                children: [

                  Image.asset(
                    'image/brain.png',
                    width: 80,
                    height: 80,
                  ),

                  Text(
                    'عيادة الأعصاب',
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
                          id: "d1",
                          title: "د. علي ناصر",
                          subtitle: "أخصائي الدماغ والأعصاب",
                          imagepath: "image/7.jpg",
                        ),

                        CoustemCard(
                          id: "d2",
                          title: "د. مازن علي",
                          subtitle: "استشاري طب الأعصاب",
                          imagepath: "image/9.jpg",
                        ),

                        CoustemCard(
                          id: "d3",
                          title: "د. ندى راشد",
                          subtitle: "خبيرة اضطرابات الأعصاب",
                          imagepath: "image/10.jpg",
                        ),

                        CoustemCard(
                          id: "d4",
                          title: "د. نور أحمد",
                          subtitle: "أخصائية السكتات الدماغية",
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