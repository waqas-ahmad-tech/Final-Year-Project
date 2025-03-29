import 'package:flutter/material.dart';
class weightAndAge extends StatelessWidget {
  weightAndAge(
      {required this.icon1,required this.lable,
        required this.onPressedP, required this.data,
        required this.onPressedM, required this.icon2}
      );
  final IconData icon1;
  final IconData icon2;
  final String data;
  final String lable;
  final VoidCallback onPressedP;
  final VoidCallback onPressedM;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          lable,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Text(data as String,style: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                child: Container(
                  child: Icon(
                    icon1,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.black54,
                onPressed: onPressedP,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Container(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                child: Icon(
                  icon2,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black54,
                onPressed: onPressedM,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
