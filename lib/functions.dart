import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;
  double _bmi;
  CalculatorBrain({this.weight, this.height});
  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi >= 18) {
      return 'Normal';
    } else
      return 'UnderWeight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'You have a higher weight than a normal body, try to exercise .';
    else if (_bmi >= 18) {
      return 'You  have a normal body weight,  Good job .';
    } else
      return 'You have an underweight than normal body, try ro eat a bit more .';
  }
}
