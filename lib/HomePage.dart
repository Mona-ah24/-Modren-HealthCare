import 'package:flutter/material.dart';
import 'package:healthcare/BrainDoctors.dart';
import 'package:healthcare/HeartDoctors.dart';
import 'package:healthcare/ToothDocturs.dart';

import 'CoustemCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _Navgitor1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BrainDoctors()),
    );
  }

  void _Navgitor2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeartDoctors()),
    );
  }

  void _Navgitor3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Toothdocturs()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  SizedBox(height: 15),

                  Text(
                    'التصنيفات',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 15),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [

                        SizedBox(width: 10),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: _Navgitor2,
                          child: Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('image/heart.png'),
                          ),
                        ),

                        SizedBox(width: 10),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: _Navgitor3,
                          child: Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('image/tooth.png'),
                          ),
                        ),

                        SizedBox(width: 10),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: _Navgitor1,
                          child: Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('image/brain.png'),
                          ),
                        ),

                        SizedBox(width: 10),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('image/arms.png'),
                          ),
                        ),

                        SizedBox(width: 10),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('image/blood.png'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'أفضل الأطباء',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.all(5),
                    width: 400,
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(width: 10),

                          CoustemCard(
                            id: "id8",
                            title: "د. زينب أحمد",
                            subtitle: "خبيرة أمراض صمامات القلب",
                            imagepath: "image/16.jpg",
                          ),

                          SizedBox(width: 10),

                          CoustemCard(
                            id: "id5",
                            title: "د. أحمد عبدالله",
                            subtitle: "استشاري أمراض القلب",
                            imagepath: "image/12.jpg",
                          ),

                          SizedBox(width: 10),

                          CoustemCard(
                            id: "id10",
                            title: "د. منى أحمد",
                            subtitle: "خبيرة تجميل الأسنان",
                            imagepath: "image/17.jpg",
                          ),

                          SizedBox(width: 10),

                          CoustemCard(
                            id: "id1",
                            title: "د. علي ناصر",
                            subtitle: "أخصائي الدماغ والأعصاب",
                            imagepath: "image/7.jpg",
                          ),
                        ],
                      ),
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