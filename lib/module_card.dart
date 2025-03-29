import 'package:flutter/material.dart';
class ModuleCard extends StatelessWidget {
  ModuleCard(
      {required this.color1,
        required this.color2,
        required this.text1,
        required this.imgPath,
        required this.voidCallback,
      }
      );
  final Color color1;
  final Color color2;
  final String text1;
  final String imgPath;
  final VoidCallback voidCallback;
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1,color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: voidCallback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Start Now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          // Image Section
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              '$imgPath', // Replace with your asset path
              height: 150,
              width: 180,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}