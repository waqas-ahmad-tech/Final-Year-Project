import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressIndication extends StatelessWidget {
  const ProgressIndication({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalSteps = 5000; // Goal steps
    final int currentSteps = 400; // Current steps taken
    double progress = currentSteps / totalSteps;
    double kcal=currentSteps*70*0.0005;
    double KM=(currentSteps*0.762)/1000;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Date Display
            Text(
              "You Required Daily 5000 Thousands Steps",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            SizedBox(height: 20),
            // Circular Progress Indicator
            CircularPercentIndicator(
              radius: 180.0,
              lineWidth: 20.0,
              percent: progress.clamp(0.0, 1.0), // Ensures it doesn't exceed 100%
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentSteps.toString(),
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
              arcType: ArcType.FULL,
              arcBackgroundColor: Colors.grey.shade400,
              startAngle: 270,
              circularStrokeCap: CircularStrokeCap.round,
              // Progress color
            ),
            // Optional Additional Information (if needed)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Resuable(icons: Icons.local_fire_department_sharp, text: kcal.toInt().toString()+' kcal', Iconcolor: Colors.orange),
                Resuable(icons: Icons.location_on, text: KM.toStringAsFixed(1)+' km', Iconcolor: Colors.red),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_walk, color: Colors.teal),
                SizedBox(width: 10),
                Text(
                  "${(progress * 100).toStringAsFixed(1)}% completed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
              ],
            ),
          ],
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