import 'package:finalyearproject/dietPlan.dart';
import 'package:finalyearproject/registeration_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Home_Page.dart';
import 'pedometer.dart';
import 'bmi_Screen.dart';
import 'login_Screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rounded_Button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'Ai_Nutritionist.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:BmiScreen(),
      ),
    );
  }
}