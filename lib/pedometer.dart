import 'package:flutter/material.dart';
import 'progressIndicator.dart';
import 'calculator_brain.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'dart:async'; // For handling asynchronous data streams
import 'package:pedometer/pedometer.dart'; // For step count and pedestrian status
import "package:permission_handler/permission_handler.dart";
class pedometer extends StatefulWidget {
   // Accept recommended steps from previous screen
  pedometer({required this.recommendedSteps});
  final int recommendedSteps;
  @override
  _MyAppState createState() => _MyAppState();
}

// State class for MyApp where all the logic and UI is handled
 class _MyAppState extends State<pedometer> {

  // Streams to listen for step count and pedestrian status updates
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  // Variables to store the current status and step count
  String _status = 'Unknown'; // Default pedestrian status
  int _steps =0;
  late int totalSteps; // Goal steps
  // final int currentSteps = _steps; // Current steps taken
  double progress =0;
  double kcal=0;
  double KM=0;
  // Default step count

  @override
  void initState() {
    super.initState();
    totalSteps=widget.recommendedSteps;// Calls the parent class's initState method
    initPlatformState(); // Initializes permissions and streams
  }

  // Callback to update step count whenever a new value is received
  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;// Update the _steps variable with the new count
      progress=_steps/totalSteps;
      kcal=_steps*70*0.0005;
      KM=(_steps*0.762)/1000;
    });
  }

  // Callback to update pedestrian status whenever a new value is received
  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status; // Update the _status variable with the new pedestrian status
    });
  }

  // Function to request activity recognition permission and initialize streams
  Future<void> initPlatformState() async {
    // Request permission for activity recognition
    bool granted = await Permission.activityRecognition.request().isGranted;

    if (granted) {
      // If permission is granted, start listening to pedestrian status and step count streams
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream.listen(onPedestrianStatusChanged); // Listen for status updates

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount); // Listen for step count updates
    } else {
      // If permission is denied, set default values
      setState(() {
        _status = 'Permission Denied';
        _steps =0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Current steps taken
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center all widgets vertically
            children: <Widget>[
              Text('You Required Daily $totalSteps Steps🏆', style: TextStyle(fontSize: 24)), // Label for steps
              SizedBox(height: 10,),
              CircularPercentIndicator(
                radius: 180.0,
                lineWidth: 20.0,
                percent: progress.clamp(0.0, 1.0), // Ensures it doesn't exceed 100%
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _steps.toString(),
                      style: TextStyle(fontSize: 58, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "steps",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.red),
                    ),
                    SizedBox(height: 100,),
                  ],
                ), // Background color of arc
                progressColor: Colors.red,
                arcType: ArcType.HALF,
                arcBackgroundColor: Colors.grey.shade400,
                startAngle: 270,
                circularStrokeCap: CircularStrokeCap.round,
                // Progress color
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Resuable(icons: Icons.local_fire_department_sharp, text: kcal.toInt().toString()+' kcal', Iconcolor: Colors.orange),
                  SizedBox(width: 30,),
                  Resuable(icons: Icons.location_on, text: KM.toStringAsFixed(1)+' km', Iconcolor: Colors.red),
                ],
              ),
              SizedBox(height: 50), // Spacer between steps and status
              Text('Pedestrian Status', style: TextStyle(fontSize: 24)), // Label for status
              Icon(
                // Display an icon based on the pedestrian status
                _status == 'walking'
                    ? Icons.directions_walk // Walking icon
                    : _status == 'stopped'
                    ? Icons.accessibility_new // Stopped icon
                    : Icons.error, // Error icon for unknown status
                size: 80, // Icon size
                color: Colors.teal, // Icon color
              ),
              Text(
                _status, // Display the current pedestrian status
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Resuable extends StatelessWidget {
  final IconData icons;
  final String text;
  final Color? Iconcolor;
  Resuable({required this.icons, required this.text, required this.Iconcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icons,
            color: Iconcolor,
          ),
          SizedBox(width: 5,),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}