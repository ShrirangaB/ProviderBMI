import 'package:flutter/material.dart';

class Calc extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  var BMIResult;
  var weight = 1;

  var height = 1;
  double get getCounter {
    return BMIResult;
  }

  // ignore: non_constant_identifier_names
  void CalculateBmi(double myHeight, double myWeight) {
    var mass = myWeight;
    var heights = myHeight / 100;
    var heightSquare = heights * heights;
    BMIResult = mass / heightSquare;
    notifyListeners();
  }
}
