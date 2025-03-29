import 'package:finalyearproject/bmi_Screen.dart';
import 'package:finalyearproject/rounded_Button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'registeration_Screen.dart';
import 'constants.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Hero(
                            tag: 'animation',
                            child: Image.asset('assets/logo.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 60,
                          width: 370,
                            child: TextField(
                                decoration: kTextFieldMessageDecoration.copyWith(
                                  hintText: 'Enter your Email',
                                  prefixIcon: Icon(Icons.email,
                                  color: Colors.black,
                                  ),
                                  fillColor: Color(0xfff7f8f9),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                          child: Container(
                            height: 60,
                            width: 370,
                            child: TextField(
                              obscureText: true,
                              decoration: kTextFieldMessageDecoration.copyWith(
                                prefixIcon: Icon(Icons.lock,
                                color: Colors.black,
                                ),
                                hintText: 'Enter your password',
                                fillColor: Color(0xFFf7f8f9),
                              ),
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 60,
                          width: 380,
                          child: Button(
                            onPressed1:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (builder)=>BmiScreen()));
                            },
                            text: 'Login', color: Colors.black,
                          ),
                        ),
                      ),
                      //TODO: REGISTER NOW FUNCTIONALITY
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 140),
                          child: Text.rich(
                            TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                            ),
                              children: [
                                TextSpan(
                              text: "Register Now",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap=(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (builder)=>RegisterationScreen()),
                                    );
                                },
                                ),
                              ],
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}