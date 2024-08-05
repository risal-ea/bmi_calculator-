import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_container.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    required this.bmiResult,       // Required parameter for the BMI result
    required this.bmiText,         // Required parameter for the BMI category text
    required this.interpretation,  // Required parameter for the BMI interpretation
  });

  final String bmiResult;
  final String bmiText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"), // AppBar title
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to fill the width
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft, // Align text to the bottom left
              padding: EdgeInsets.all(10.0), // Add padding around the text
              child: Text(
                "Your Result!",
                style: TextStyle(
                  fontSize: 40.0, // Font size for the result heading
                  fontWeight: FontWeight.w800, // Font weight for the result heading
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6, // Take up 6 parts of the available space
            child: ReusableCard(
              colour: kCardColour, // Color for the result card
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space children evenly
                children: <Widget>[
                  Text(
                    bmiText.toUpperCase(), // Display BMI category text in uppercase
                    style: kResultTextStyle, // Style for the BMI category text
                  ),
                  Text(
                    bmiResult, // Display the calculated BMI result
                    style: kBmiTextStyle, // Style for the BMI result
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0), // Add horizontal padding
                    child: Text(
                      interpretation, // Display the interpretation of the BMI
                      style: kBodyTextStyle, // Style for the BMI interpretation
                      textAlign: TextAlign.center, // Center-align the interpretation text
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            bottomContainerText: "RE-CALCULATE", // Text for the button
            onPress: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ],
      ),
    );
  }
}
