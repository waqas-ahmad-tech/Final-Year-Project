import 'dart:io';

import 'package:finalyearproject/bmi_Screen.dart';
import 'package:finalyearproject/login_Screen.dart';
import 'package:finalyearproject/resultPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:open_share_plus/open.dart';
import 'exerciseCard.dart';
import 'dietPlan.dart';
import 'package:pedometer/pedometer.dart';
import 'pedometer.dart';
import 'module_card.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';
import 'Ai_Nutritionist.dart';
import 'package:url_launcher/url_launcher.dart';

class Resultpage extends StatefulWidget {
  Resultpage({
    required this.Bmiresult,
    required this.BmiCategory,
    required this.bmiImage,
    required this.interpretation,
    required this.steps,
  });

  final double Bmiresult;
  final Image bmiImage;
  final String BmiCategory;
  final String interpretation;
  final int steps;

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  Future<void> openWhatsAppChat() async {
    String formattedNumber = "+923160869090".replaceAll(RegExp(r'[^0-9]'), ''); // Clean phone number
    String message = ""; // Optional message

    // Open WhatsApp
    await Open.whatsApp(whatsAppNumber: formattedNumber, text: message);
  }
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Center(
              child: Text(
                '${widget.BmiCategory}',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF070A17),
                  ),
                  child: Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder)=>LoginScreen()));
                  },
                ),
                ListTile(
                  title: Text('BMI Calculator', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder)=>BmiScreen()));
                  },

                ),
              ],
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: widget.bmiImage,
                  ),
                  Text(
                    '${widget.interpretation}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  if (widget.BmiCategory == 'Underweight') ...[
                    ModuleCard(color1: Color(0xFF6274e7), color2: Color(0xFF8752a3), text1: 'Running', imgPath: 'assets/running.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => pedometer(recommendedSteps: widget.steps),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ModuleCard(color1: Color(0xFF30c5d2), color2: Color(0xFF471069), text1: 'Muscle Building\nExercises', imgPath: 'assets/exercise.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => ExerciseCard(bmiCategory: widget.BmiCategory,),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ModuleCard(color1: Color(0xFFea5459), color2: Color(0xFF210cae), text1: 'Diet Plan', imgPath: 'assets/Diet1.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => Dietplan(
                              bmiCategory: widget.BmiCategory,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Color(0xFF6274e7), color2: Color(0xFF8752a3), text1: 'AI Nutritionist', imgPath: 'assets/Ain2.png',
                      voidCallback: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>AiNutritionist()));
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Colors.teal, color2: Colors.green, text1: 'Consultant', imgPath: 'assets/Whatsapp.png',
                      voidCallback: () async {
                        await openWhatsAppChat();
                    },),
                  ] else if (widget.BmiCategory == 'Normal') ...[
                    ModuleCard(color1: Color(0xFF6274e7), color2: Color(0xFF8752a3), text1: 'Running', imgPath: 'assets/running.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => pedometer(recommendedSteps: widget.steps),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ModuleCard(color1: Color(0xFF30c5d2), color2: Color(0xFF471069), text1: 'Regular\nExercises', imgPath: 'assets/exercise.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => ExerciseCard(bmiCategory: widget.BmiCategory),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ModuleCard(color1: Color(0xFFea5459), color2: Color(0xFF210cae), text1: 'Diet Plan', imgPath: 'assets/Diet1.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => Dietplan(
                              bmiCategory: widget.BmiCategory,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Color(0xFF6274e7), color2: Color(0xFF8752a3), text1: 'AI Nutritionist', imgPath: 'assets/Ain2.png',
                      voidCallback: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>AiNutritionist()));
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Colors.teal, color2: Colors.green, text1: 'Consultant', imgPath: 'assets/Whatsapp.png',
                      voidCallback: () async {
                        await
                        openWhatsAppChat();
                    },),
                  ] else if (widget.BmiCategory == 'Overweight' || widget.BmiCategory == 'Obesity' || widget.BmiCategory == 'Very Severe Obesity') ...[
                    ModuleCard(color1: Color(0xFF6274e7), color2: Color(0xFF8752a3), text1: 'Running', imgPath: 'assets/running.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => pedometer(recommendedSteps: widget.steps),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ModuleCard(color1: Color(0xFF30c5d2), color2: Color(0xFF471069), text1: 'Exercises', imgPath: 'assets/exercise.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => ExerciseCard(bmiCategory: widget.BmiCategory,),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ModuleCard(color1: Color(0xFFea5459), color2: Color(0xFF210cae), text1: 'Diet Plan', imgPath: 'assets/Diet1.png',
                      voidCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => Dietplan(
                              bmiCategory: widget.BmiCategory,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Color(0xFF6274e7), color2: Color(0xFF8752a3), text1: 'AI Nutritionist', imgPath: 'assets/Ain2.png',
                      voidCallback: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>AiNutritionist()));
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Colors.teal, color2: Colors.green, text1: 'Consultant',
                      imgPath: 'assets/Whatsapp.png',
                      voidCallback: () async{
                       await  openWhatsAppChat();
                    },),
                  ],
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}