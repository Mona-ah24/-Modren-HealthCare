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
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image.asset('image/30.png', width: 50, height: 50),
                  //صورة الشعار
                  // Positioned(left: 100,top: 100,child:
                  // Container(
                  //   width: 300,
                  //   height: 30,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       icon: Icon(Icons.search),
                  //         filled: true,
                  //         fillColor: Colors.white70,
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(40),
                  //           borderSide: BorderSide.none,
                  //         )
                  //     ),
                  //   ),),
                  // )
                  SizedBox(height: 15),
                  Text(
                    'Categories',
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
                              //color: Colors.white,

                              // boxShadow:[BoxShadow(color:Colors.white70,blurRadius: 10 ),]
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
                              //color: Colors.white,
                              // boxShadow:[BoxShadow(color:Colors.white70,blurRadius: 10 ),]
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
                              // color: Colors.white,

                              //boxShadow: [
                              //  BoxShadow(color: Colors.white70, blurRadius: 10),
                              // ],
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
                              //color: Colors.white,

                              //boxShadow: [
                              //  BoxShadow(color: Colors.white70, blurRadius: 10),
                              //],
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
                              //color: Colors.white,

                              // boxShadow: [
                              // BoxShadow(color: Colors.white70, blurRadius: 10),
                              // ],
                            ),
                            child: Image.asset('image/blood.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Bast Doctors',
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
                    height:  300,
                    child: SingleChildScrollView(
                    
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: 10,),
                          // Card(
                          //   color: Colors.white70,
                          //
                          // )
                          SizedBox(width: 10),
                          CoustemCard(
                            title: "Dr.Zainab Ahmed",
                            subtitle: "Valve Disease Expert",
                            imagepath: "image/16.jpg",
                          ),

                          SizedBox(width: 10),

                          CoustemCard(
                            title: "Dr.Mohammed Abdollah",
                            subtitle: "Cardiology Consultant",
                            imagepath: "image/12.jpg",
                          ),

                          SizedBox(width: 10),
                          /*Container(
                              width: 350,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, blurRadius: 10),
                                ],
                              )*/
                          //child:
                          CoustemCard(
                            title: "Dr.Mona Ahmed",
                            subtitle: "Cosmetic Dentistry Expert",
                            imagepath: "image/17.jpg",
                          ),
                          //),
                          SizedBox(width: 10),
                          CoustemCard(
                            title: "Dr.Ali Nasse",
                            subtitle: "Brain & Nerve Specialist",
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
