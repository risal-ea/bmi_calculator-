import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_container.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Your Result!",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kCardColour,
              onPress: () {},
              cardChild: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "OVERWEIGHT",
                    style: kResultTextStyle,
                  ),
                  Text(
                    "18.0",
                    style: kBmiTextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Text(
                      "Your BMI result is quietly low, you should eat more.",
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            bottomContainerText: "RE-CALCULUATE",
            onPress: (){Navigator.pop(context);},
          ),
        ],
      ),
    );
  }
}
