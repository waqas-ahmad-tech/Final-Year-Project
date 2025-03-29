import 'package:finalyearproject/bmi_Screen.dart';
import 'package:finalyearproject/resultPage.dart';
import 'package:flutter/animation.dart';
import 'exerciseCard.dart';
import 'dietPlan.dart';
import 'package:pedometer/pedometer.dart';
import 'pedometer.dart';
import 'module_card.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';
import 'Ai_Nutritionist.dart';
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
                        Navigator.pushReplacement(
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>AiNutritionist()));
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Colors.teal, color2: Colors.green, text1: 'Consultant', imgPath: 'assets/Whatsapp.png', voidCallback: () {},),
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
                        Navigator.pushReplacement(
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>AiNutritionist()));
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Colors.teal, color2: Colors.green, text1: 'Consultant', imgPath: 'assets/Whatsapp.png', voidCallback: () {},),
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
                        Navigator.pushReplacement(
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>AiNutritionist()));
                      },
                    ),
                    SizedBox(height: 10,),
                    ModuleCard(color1: Colors.teal, color2: Colors.green, text1: 'Consultant', imgPath: 'assets/Whatsapp.png', voidCallback: () {},),
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