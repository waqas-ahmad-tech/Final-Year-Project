import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({ required this.label,required this.path}); // Comma added here
  final String path;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          width: double.infinity,
          child:
        Image.asset(path),
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0XFF8D8E98),
          ),
        ),
      ],
    );
  }
}