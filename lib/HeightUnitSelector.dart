import 'package:flutter/material.dart';
class HeightUnitSelector extends StatelessWidget {
  HeightUnitSelector({
    required this.initialItem,
    required this.ItemCount,
    required this.unit,
    required this.onChange,
  });

  final int initialItem;
  final int ItemCount;
  final String unit;
  final ValueChanged<int> onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListWheelScrollView.useDelegate(
                itemExtent: 40,
                perspective: 0.005,
                diameterRatio: 2.0,
                onSelectedItemChanged: onChange,
                controller: FixedExtentScrollController(initialItem: initialItem),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    // Check if this index is the selected item
                    bool isSelected = index == initialItem;

                    return Center(
                      child: Text(
                        (unit == 'ft' ? index + 4 : index).toString(),
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
                        ),
                      ),
                    );
                  },
                  childCount: ItemCount,
                ),
              ),
              Positioned(
                top: 30,
                child: Container(
                  height: 3,
                  width: 70,
                  color: Colors.pink, // Top border color
                ),
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  height: 3,
                  width: 70,
                  color: Colors.pink, // Bottom border color
                ),
              ),
            ],
          ),
        ),
        Text(
          unit,
          style: TextStyle(fontSize: 20.0, color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}