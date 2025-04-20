import 'package:finalyearproject/dietPlan.dart';
import 'package:finalyearproject/registeration_Screen.dart';
import 'package:finalyearproject/resultPage.dart';
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
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBaowlQYN3xq-EuWnl3z0_sCaWbJ07a0-I",
        appId: "1:529950904995:android:65a51b168e5b8e7154a516",
        messagingSenderId: "529950904995",
        projectId: "finalyearproject-954d6"
    ),
  );
  runApp(MyApp());
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
        body:HomePage(),
      ),
    );
  }
}