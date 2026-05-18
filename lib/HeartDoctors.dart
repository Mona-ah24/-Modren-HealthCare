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
                  Image.asset('image/heart.png', width: 80, height: 80),

                  Text(
                    'عيادة القلب',
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
                          title: "د. أحمد عبدالله",
                          subtitle: "استشاري أمراض القلب",
                          imagepath: "image/12.jpg",
                        ),

                        CoustemCard(
                          id: "id6",
                          title: "د. سامي حسن",
                          subtitle: "أخصائي قسطرة القلب",
                          imagepath: "image/13.jpg",
                        ),

                        CoustemCard(
                          id: "id7",
                          title: "د. عمر بدر",
                          subtitle: "أخصائي آلام الصدر",
                          imagepath: "image/14.jpg",
                        ),

                        CoustemCard(
                          id: "id8",
                          title: "د. زينب أحمد",
                          subtitle: "خبيرة أمراض صمامات القلب",
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
