import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  Button({required this.color, required this.text, required this.onPressed1});
  final Color color;
  final String text;
  final VoidCallback onPressed1;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
        onPressed: onPressed1,
        child: Text(
          text as String,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
    );
  }
}

// Material(
// elevation: 5,
// color: this.color,
// borderRadius: BorderRadius.circular(10),
// child: MaterialButton(
// onPressed: onPressed1,
// child:Text(
// text as String,
// style: TextStyle(
// fontSize: 15,
// color: Colors.white,
// ),
// ),
// minWidth: 200,
// height: 45,
// ),
// );