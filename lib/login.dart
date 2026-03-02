import 'package:flutter/material.dart';
//import 'package:healthcare/HomePage.dart';
import 'package:healthcare/Indexpage.dart';
import 'package:healthcare/sign.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ضبط احجام الشاشه تلقائيا

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Indexpage()),
      );
    }
    _formKey.currentState?.save();
  }

  void _Navgitor() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Sign()));
  }

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('image/new.jpg', fit: BoxFit.cover),
          ),

          Positioned(
            right: 30,
            left: 30,

            child: Image.asset("image/30.png", width: 200, height: 200),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Container(
                width: screenWidth * 400,
                height: screenHeight * 400,
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
                          //styling
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
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'E-Mail',
                                labelStyle: TextStyle(color: Colors.white),
                                //filled: true,

                                // fillColor: Colors.white.withOpacity(0.7),
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
                          //text input
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
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
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
                        ],
                      ),
                    ),
                    //Padding(
                    // padding: const EdgeInsets.symmetric({}),
                    // child:
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 100),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "forget password?",
                              style: TextStyle(
                                color: const Color.fromARGB(221, 16, 92, 122),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //),
                    ElevatedButton(
                      onPressed: _submit,
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(
                          const Color.fromARGB(221, 16, 92, 122),
                        ),
                        elevation: MaterialStateProperty.all(10),
                      ),
                      //ElevatedButton.styleFrom(

                      //),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: const Color.fromARGB(221, 16, 92, 122),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account"),
                        TextButton(
                          onPressed: _Navgitor,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: const Color.fromARGB(221, 16, 92, 122),
                            ),
                          ),
                        ),
                      ],
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
