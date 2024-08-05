import 'dart:math';

class CalculatorBrain {

  // Constructor for CalculatorBrain class
  CalculatorBrain({
    required this.height, // Height in cm
    required this.weight, // Weight in kg
  });

  final int height; // Height of the person
  final int weight; // Weight of the person

  double _bmi = 0.0; // Variable to store the calculated BMI

  // Method to calculate BMI
  String calculateBMI() {
    // BMI formula: weight (kg) / (height (m))^2
    _bmi = weight / pow(height / 100, 2); // Convert height to meters
    return _bmi.toStringAsFixed(1); // Return BMI with one decimal place
  }

  // Method to get the BMI result as a string
  String getResult() {
    // Return a string based on BMI value
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  // Method to get the interpretation of the BMI
  String getInterPretation() {
    // Return a message based on BMI value
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have normal weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
