import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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

          Center(
            child: Column(
              children: [

                SizedBox(height: 20),

                Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 50,
                ),

                Text(
                  'تعديل الحساب',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),

                  title: Text(
                    'الاسم',
                    style: TextStyle(color: Colors.white),
                  ),

                  onTap: () {
                    print("الاسم");
                  },
                ),

                ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),

                  title: Text(
                    'البريد الإلكتروني',
                    style: TextStyle(color: Colors.white),
                  ),

                  onTap: () {
                    print("البريد الإلكتروني");
                  },
                ),

                ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),

                  title: Text(
                    'رقم الهاتف',
                    style: TextStyle(color: Colors.white),
                  ),

                  onTap: () {
                    print("رقم الهاتف");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}