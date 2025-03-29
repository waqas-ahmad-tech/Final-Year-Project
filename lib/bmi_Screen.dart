import 'dart:ui';
import 'resultPage.dart';
import 'calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'rounded_Button.dart';
import 'constants.dart';
import 'icon_Content.dart';
import 'reusable_Card.dart';
import 'HeightUnitSelector.dart';
import 'weightAndage.dart';
class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  Color maleCardColor=kActiveCardColor;
  Color femaleActiveCardColor=kActiveCardColor;
  void updateColor(int gender){
    if(gender==1){
      maleCardColor=Colors.pink.shade300;
      femaleActiveCardColor=kActiveCardColor;
    }
    else if(gender==2){
      femaleActiveCardColor=Colors.pink.shade300;
      maleCardColor=kActiveCardColor;
    }
  }
  int selectedFeet = 5;
  int selectedInches = 3;
  int selectedWeight=45;
  int selectedAge=25;
  int finalHeight=0;
  int gender=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender=1;
                            updateColor(1);
                          });
                        },
                        child: ReusableCard(
                            colour: maleCardColor,
                            cardChild:IconContent(
                              path: 'assets/ficon.png',
                              label: 'MALE',
                            ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender=2;
                            updateColor(2);
                          });
                        },
                        child: ReusableCard(
                          colour: femaleActiveCardColor,
                          cardChild: IconContent(
                            path: 'assets/fmicon.png',
                            label: "FEMALE",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //TODO: Ab iski Baari hai

              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Row No.1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height (inches)',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      //Row NO.2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //HightSelector Widget For feet
                          HeightUnitSelector(
                              initialItem: selectedFeet - 4,
                              ItemCount: 8,
                              unit: 'ft',
                              onChange: (newFeet) {
                                setState(() {
                                  selectedFeet = newFeet + 4;
                                  print('your feet is $selectedFeet');
                                });
                              }),
                          SizedBox(
                            width: 120,
                          ),
                          //heightSelector for inch
                          HeightUnitSelector(
                              initialItem: selectedInches,
                              ItemCount: 12,
                              unit: 'in',
                              onChange: (newInches) {
                                setState(() {
                                  selectedInches = newInches;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Center(
                        child: Center(child:
                        weightAndAge(
                          lable: 'Weight(Kg)',
                          data:"$selectedWeight",
                          icon1: Icons.add,
                          icon2: Icons.remove,
                          onPressedP: (){
                            setState(() {
                              selectedWeight++;
                            });
                          },
                          onPressedM: (){
                            setState(() {
                              selectedWeight--;
                            });
                          },
                        ),
                        ),
                      ),
                    )),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Center(
                          child: weightAndAge(
                            lable: "Age",
                            data: '$selectedAge',
                            icon1: Icons.add,
                            icon2: Icons.remove,
                            onPressedP: (){
                              setState(() {
                                selectedAge++;
                              });
                            },
                            onPressedM: (){
                              setState(() {
                                selectedAge--;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  print('Weight = $selectedWeight');
                  print('height = ${(selectedFeet*0.3048)+(selectedInches*0.0254)}');
                  CalculatorBrain calc=new CalculatorBrain(
                      height: (selectedFeet*0.3048)+(selectedInches*0.0254), weight: selectedWeight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder)=>Resultpage(
                        Bmiresult: calc.calculateBMI(),
                        BmiCategory: calc.getBmiCategory(),
                        bmiImage: calc.getImage(gender),
                        interpretation: calc.getInterpretation(),
                        steps: calc.recommendedStpes(),
                      )));
                  print('Steps are ${calc.recommendedStpes()}');
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 65,
                  width: double.infinity,
                  color: Colors.pink,
                  child: Center(
                    child: Text("CALCULATE",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
