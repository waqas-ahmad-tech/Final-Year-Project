import 'package:flutter/material.dart';
import 'exerciseModule.dart';
class ExerciseCard extends StatefulWidget {
  ExerciseCard({required this.bmiCategory});
  final String bmiCategory;

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            'Exercise',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(widget.bmiCategory=="Underweight")...[
              customExercise(exerciseTitle: 'Barbell sumo deadlift', path: 'assets/Muscle Building Exercise/barbell sumo deadlift.gif'),
              customExercise(exerciseTitle: 'Dumbbell bent over row.gif', path: 'assets/Muscle Building Exercise/dumbbell bent over row.gif'),
              customExercise(exerciseTitle: 'Flutter kicks', path: 'assets/Muscle Building Exercise/flutter kicks.gif'),
              customExercise(exerciseTitle: 'Jumping lunges cardio', path: 'assets/Muscle Building Exercise/jumping lunges cardio.gif'),
              customExercise(exerciseTitle: 'Lever chest press', path: 'assets/Muscle Building Exercise/lever chest press.gif'),
              customExercise(exerciseTitle: 'Mountain climber', path: 'assets/Muscle Building Exercise/mountain climber.gif'),
              customExercise(exerciseTitle: 'Push Up', path: 'assets/Muscle Building Exercise/Push Up.gif'),
              customExercise(exerciseTitle: 'Reverse grip pull up', path: 'assets/Muscle Building Exercise/reverse grip pull up.gif'),
              customExercise(exerciseTitle: 'Squat', path: 'assets/Muscle Building Exercise/squat.gif'),
            ] else if(widget.bmiCategory=="Normal")...[
              customExercise(exerciseTitle: 'Burpee', path: 'assets/Healthy Exercises/Burpee with push ups.gif'),
              customExercise(exerciseTitle: 'Over head Squat', path: 'assets/Healthy Exercises/Over head Squat.gif'),
              customExercise(exerciseTitle: 'Cobra pose Stretching', path: 'assets/Healthy Exercises/Cobra pose Stretching.gif'),
              customExercise(exerciseTitle: 'Downward Stretching', path: 'assets/Healthy Exercises/Downward Facing Dog Stretching.gif'),
              customExercise(exerciseTitle: 'Jumping Jack', path: 'assets/Healthy Exercises/Jumping Jack.gif'),
              customExercise(exerciseTitle: 'Low Plank Leg Raise', path: 'assets/Healthy Exercises/Low Plank Leg Raise.gif'),
              customExercise(exerciseTitle: 'Mountain Clicmber', path: 'assets/Healthy Exercises/Mountain Clicmber.gif'),
              customExercise(exerciseTitle: 'Push Up', path: 'assets/Healthy Exercises/Push Up.gif'),
            ]
            else if(widget.bmiCategory == 'Overweight' || widget.bmiCategory == 'Obesity' || widget.bmiCategory == 'Very Severe Obesity')...[
                customExercise(exerciseTitle: 'Bench pistol squat', path: 'assets/Exercise/bench pistol squat.gif'),
                customExercise(exerciseTitle: 'Elliptical machine exercise', path: 'assets/Exercise/elliptical machine exercise.gif'),
                customExercise(exerciseTitle: 'Low plank leg raise', path: 'assets/Exercise/low plank leg raise.gif'),
                customExercise(exerciseTitle: 'Resistance hipabduction', path: 'assets/Exercise/resistance band hipabduction.gif'),
                customExercise(exerciseTitle: 'Knee push up', path: 'assets/Exercise/knee push up.gif'),
                customExercise(exerciseTitle: 'Stationary bike exercise', path: 'assets/Exercise/stationary bike exercise.gif'),
                customExercise(exerciseTitle: 'Step up exercise for legs', path: 'assets/Exercise/step up exercise for legs.gif'),
              ]
          ],
        ),
      ),
    );
  }
}

class customExercise extends StatelessWidget {
  customExercise({
    required this.exerciseTitle, required this.path
  });
  final String exerciseTitle;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 2, right: 2),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$exerciseTitle',//ExerciseTitle
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),),
                  Text('Repeate 2 Times'),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined),
                      Text(
                        '00:30',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Hero(tag:'img',
                    child:
                    Container(
                      height: 100,
                        width: 100,
                        child: Image.asset('$path'))),//Path
                Icon(Icons.arrow_forward_ios_rounded),
              ],)
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>ExerciseModule(path: path)));
      },
    );
  }
}

