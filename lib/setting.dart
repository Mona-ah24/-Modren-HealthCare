import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/new.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 10,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 28,
        ),
      ),

      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              "image/new.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [

              SizedBox(height: 25),

              Icon(
                Icons.settings,
                size: 50,
                color: Colors.white,
              ),

              Text(
                'الإعدادات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 25),

              ListTile(
                leading: Icon(Icons.language, color: Colors.white),
                title: Text(
                  'اللغة',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  print("Language");
                },
              ),

              ListTile(
                leading: Icon(Icons.accessibility_new, color: Colors.white),
                title: Text(
                  'إمكانية الوصول',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  print("Access");
                },
              ),

              ListTile(
                leading: Icon(Icons.question_mark, color: Colors.white),
                title: Text(
                  'المساعدة والبيانات',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  print("Help & Data");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}