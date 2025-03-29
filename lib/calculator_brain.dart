import 'package:flutter/material.dart';
import 'module_card.dart';
import 'dart:math';
import 'dart:ui';

import 'package:finalyearproject/calculator_brain.dart';
class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});
  double? height;
  int? weight;
  double? _bmi;
  double calculateBMI(){
    _bmi=weight! / pow(height!, 2)!;
    return _bmi!;
  }
  Image getImage(int gender){
    if(_bmi! < 18.5 && gender==1)
      return Image.asset('assets/underweightall.png');
    else if(_bmi! < 18.5 && gender==2)
      return Image.asset('assets/underweightall.png');
    else if(_bmi!>=18.5 && _bmi!<=24.9 && gender==1){
      //healthy bmi boy
      return Image.asset('assets/healthyb.png');
    }
    else if(_bmi!>=18.5 && _bmi!<=24.9 && gender==2){
      //healthy bmi woman
      return Image.asset('assets/healthyfm.png');
    }
    else if(_bmi!>=24.9 && _bmi!<=29.9 && gender==1){
      //overweight boy
      return Image.asset('assets/overweightb.jpeg');
    }
    else if(_bmi!>=24.9 && _bmi!<=29.9 && gender==2){
      //overweight woman
      return Image.asset('assets/overweightfm.png');
    }
    else if(_bmi!>=30.0 && _bmi!<=39.9 && gender==1){
      //obesity boy
      return Image.asset('assets/obesityb.png');
    }
    else if(_bmi!>=30.0 && _bmi!<=39.9 && gender==2){
      //obesity woman
      return Image.asset('assets/obesityfm.png');
    }
    else {
      return Image.asset('assets/moreobesityall.png');
    }
  }


  String getBmiCategory(){
    if(_bmi! < 18.5){
      //underweight
      return 'Underweight';
    }
    else if(_bmi!>=18.5 && _bmi!<=24.9){
      //normal bmi
      return 'Normal';
    }
    else if(_bmi!>=25.0 && _bmi!<=29.9){
      //overweight
      return 'Overweight';
    }
    else if(_bmi!>=30.0 && _bmi!<=39.9){
      //obesity
      return 'Obesity';
    }
    else {
      //very obesity
      return 'Very Severe Obesity';
    }
  }
  String getInterpretation(){
    if(_bmi! < 18.5)
      return'You need to gain some weight. You can follow this steps:';
    else if(_bmi!>=18.5 && _bmi!<=24.9){
      return 'You have a perfect weight. Just maintain this weight follow some lifestyles.';
    }
    else if(_bmi!>=25.0 && _bmi!<=29.9){
      return 'You are gaining some extra weight. Follow the necessart steps:';
    }
    else if(_bmi!>=30.0 && _bmi!<=39.9){
      return'Your overweight is becoming risky. Follow the necessary steps:';
    }
    else {
      return 'Your weight is in the risky stage. Please follow the necessary steps:';
    }
  }
  int recommendedStpes(){
    if(_bmi! < 18.5)
      return 5000;
    else if(_bmi!>=18.5 && _bmi!<=24.9){
      return 7000;
    }
    else if(_bmi!>=25.0 && _bmi!<=29.9){
      return 10000;
    }
    else if(_bmi!>=30.0 && _bmi!<=39.9){
      return 12000;
    }
    else {
      return 5000;
    }
  }
  void BMIFIX(){
    if(_bmi! < 18.5){
    }
    else {
    }
  }
}