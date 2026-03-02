import 'package:flutter/material.dart';
//import 'package:healthcare/Indexpage.dart';
import 'package:healthcare/login.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  // TextEditingController _Name=TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _Navgitor() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
    _formKey.currentState?.save();
  }

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 80),
            child: Image.asset("image/30.png", width: 200, height: 200),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white, // أبيض مع شفافية
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(170),
                    topRight: Radius.circular(170),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),

                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'Name',
                                hintText: 'Enter your Name',
                                //filled: true,
                                //fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              // controller: _Name,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid Name!';
                                }
                                return null;
                              },
                            ),
                          ),

                          //styling
                          SizedBox(height: 10),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),

                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'E-Mail',
                                labelStyle: TextStyle(color: Colors.white),
                                //filled: true,
                                //fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                    ).hasMatch(value!)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                            ),
                          ),

                          //box styling
                          SizedBox(height: 10),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/new.jpg"),

                                fit: BoxFit.cover,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                // iconColor: Colors.white,
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'Password',
                                //filled: true,
                                //fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {},
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid password!';
                                }
                                return null;
                              },
                            ),
                          ),

                          //text input
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                    // ElevatedButton(onPressed: _submit, child: Text('SIGN IN')),
                    ElevatedButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(
                        const Color.fromARGB(221, 16, 92, 122), 
                        ),
                        elevation: MaterialStateProperty.all(10),
                      ),
                      onPressed: _Navgitor,
                      child: Text('Sign up',
                    style: TextStyle(
                              color: const Color.fromARGB(221, 16, 92, 122),
                    ))
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
