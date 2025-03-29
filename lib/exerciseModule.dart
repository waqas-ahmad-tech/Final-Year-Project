import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
class ExerciseModule extends StatefulWidget {
  ExerciseModule({required this.path});
  final String path;
  @override
  State<ExerciseModule> createState() => _ExerciseModuleState();
}

class _ExerciseModuleState extends State<ExerciseModule> {
  final CountDownController controller= new CountDownController();
  bool isPlaying = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Hero(
                tag: 'img',
                child: Image.asset(widget.path),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: NeonCircularTimer(
                // innerFillColor: Colors.blue,
                  strokeWidth: 10,
                  innerFillGradient: LinearGradient(colors: [
                    Colors.greenAccent.shade200,
                    Colors.blueAccent.shade400
                  ]),
                  neumorphicEffect: true,
                  isTimerTextShown: true,
                  width: 175,
                  duration: 20,
                  controller: controller),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.teal,

                  ),
                  child: IconButton(
                    iconSize: 25,
                    color: Colors.white,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow), // Toggle icon
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying; // Toggle the state
                      });

                      if (isPlaying) {
                        controller.resume(); // Start the timer
                      } else {
                        controller.pause(); // Pause the timer
                      }
                    },
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.teal,
                  ),
                  child: IconButton(
                      iconSize: 25,
                      color: Colors.white,
                      onPressed: (){
                        controller.restart();
                      },
                      icon: Icon(Icons.repeat)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
