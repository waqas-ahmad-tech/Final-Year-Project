import 'package:finalyearproject/constants.dart';
import 'package:finalyearproject/login_Screen.dart';
import 'package:finalyearproject/rounded_Button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});
  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 130,
                      height: 130,
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
                          hintText: 'Username',
                          fillColor: Color(0xfff7f8f9),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 60,
                      width: 370,
                      child: TextField(
                        decoration: kTextFieldMessageDecoration.copyWith(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email,
                            color: Colors.black,
                          ),
                          fillColor: Color(0xfff7f8f9),
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
                        obscureText: true,
                        decoration: kTextFieldMessageDecoration.copyWith(
                          prefixIcon: Icon(Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: 'Password',
                          fillColor: Color(0xFFf7f8f9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60,
                      width: 380,
                      child: Button(
                        onPressed1:(){},
                        text: 'Register', color: Colors.black,
                      ),
                    ),
                  ),
                  //TODO: REGISTER NOW FUNCTIONALITY
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 122),
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "Login Now",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap=(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (builder)=>LoginScreen()),
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
