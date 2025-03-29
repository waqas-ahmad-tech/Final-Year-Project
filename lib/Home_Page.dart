import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:finalyearproject/rounded_Button.dart';
import 'package:flutter/material.dart';
import 'login_Screen.dart';
import 'package:finalyearproject/rounded_Button.dart';
import 'registeration_Screen.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
      return  SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFCFEFB),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 350,
                      width: double.infinity,
                      child: Hero(
                        tag: 'animation',
                        child: Image.asset(
                          'assets/back.png', // Replace with your image asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     Column(
                        children: [
                          Text('welcome to',style: TextStyle(fontSize: 20,color: Colors.black),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('FITLIFE', style: TextStyle(
                                fontWeight: FontWeight.w900,fontSize: 30, color: Colors.black,
                              ),
                              ),
                              Text(' JOURNEY', style: TextStyle(
                                fontWeight: FontWeight.w900,fontSize: 30, color: Color(0xff8781FF),

                              ),
                              ),
                            ],
                          ),
                          Text('Embark on a journey to a healthier and fitter you.',
                            style: TextStyle(fontSize: 15,color: Colors.black),
                          ),
                        ],
                      ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder)=>LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8781FF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                        onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (builder)=>RegisterationScreen()));
                        },//TODO: REIGSTER
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          )
            ),
      );
  }
}
