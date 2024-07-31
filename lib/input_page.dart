import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFFF4EEE0),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                  colour: selectedGender == Gender.male
                      ? kCardColour
                      : kInactiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                  colour: selectedGender == Gender.female
                      ? kCardColour
                      : kInactiveCardColour,
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Height",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                          thumbColor: Colors.red,
                          overlayColor: Colors.red.withAlpha(32),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 260.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  colour: kCardColour,
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Weight",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            FontAwesomeIcons.plus,
                            () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width: 14.0),
                          RoundIconButton(
                            FontAwesomeIcons.minus,
                            () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              age++;
                            });
                          }),
                          SizedBox(
                            width: 14.0,
                          ),
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              age--;
                            });
                          })
                        ],
                      ),
                    ],
                  ),
                  colour: kCardColour,
                ),
              ),
            ],
          )),
          Container(
            color: kBottomContainerColour,
            margin: const EdgeInsets.only(top: 10),
            height: kBottomContainerHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
    this.icon,
    this.onPressed,
  );

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 25.0,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 12.0,
      fillColor: Color(0xFF8D8E98),
      onPressed: onPressed,
    );
  }
}
