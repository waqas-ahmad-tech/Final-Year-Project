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

class _MyAppState extends State<pedometer> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  String _status = 'Unknown';
  int? _lastStepCount;
  int _steps = 0;
  late int totalSteps;
  double progress = 0;
  double kcal = 0;
  double KM = 0;

  int? _initialStepCount;

  @override
  void initState() {
    super.initState();
    totalSteps = widget.recommendedSteps;
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    setState(() {
      if (_lastStepCount == null) {
        _lastStepCount = event.steps;
      }

      int diff = event.steps - _lastStepCount!;

      if (diff > 0) {
        _steps += diff; // Yeh apna custom step counter hai
      }

      _lastStepCount = event.steps;

      // Update progress and stats
      progress = _steps / totalSteps;
      kcal = _steps * 70 * 0.0005;
      KM = (_steps * 0.762) / 1000;

      if (_steps >= totalSteps) {
        // Optional reset logic
        _steps = 0;
        _lastStepCount = event.steps;
      }
    });
  }


  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  Future<void> initPlatformState() async {
    bool granted = await Permission.activityRecognition.request().isGranted;

    if (granted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream.listen(onPedestrianStatusChanged);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount);
    } else {
      setState(() {
        _status = 'Permission Denied';
        _steps = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You Required Daily $totalSteps Steps🏆', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              CircularPercentIndicator(
                //TODO: Pedometer yahan sy set hoga
                radius: 160.0,
                lineWidth: 20.0,
                percent: progress.clamp(0.0, 1.0),
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
                    SizedBox(height: 100),
                  ],
                ),
                progressColor: Colors.red,
                arcType: ArcType.HALF,
                arcBackgroundColor: Colors.grey.shade400,
                startAngle: 270,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Resuable(icons: Icons.local_fire_department_sharp, text: kcal.toInt().toString() + ' kcal', Iconcolor: Colors.orange),
                  SizedBox(width: 30),
                  Resuable(icons: Icons.location_on, text: KM.toStringAsFixed(1) + ' km', Iconcolor: Colors.red),
                ],
              ),
              SizedBox(height: 50),
              Text('Pedestrian Status', style: TextStyle(fontSize: 24)),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 80,
                color: Colors.teal,
              ),
              Text(
                _status,
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
          SizedBox(width: 5),
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
