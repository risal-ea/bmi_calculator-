import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_container.dart';
import '../calculator_brain.dart';

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
  Gender? selectedGender; // Currently selected gender (male or female)
  int height = 180; // Default height in cm
  int weight = 60; // Default weight in kg
  int age = 20; // Default age in years

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'), // AppBar title
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xFFF4EEE0), // Text color for AppBar title
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
                        selectedGender = Gender.male; // Set selected gender to male
                      });
                    },
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                    colour: selectedGender == Gender.male
                        ? kCardColour // Color for selected male card
                        : kInactiveCardColour, // Color for unselected male card
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female; // Set selected gender to female
                      });
                    },
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                    colour: selectedGender == Gender.female
                        ? kCardColour // Color for selected female card
                        : kInactiveCardColour, // Color for unselected female card
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
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
                            const Text(
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
                                height = newValue.round(); // Update height value
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    colour: kCardColour, // Color for the height card
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
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
                                  weight++; // Increment weight
                                });
                              },
                            ),
                            const SizedBox(width: 14.0),
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                                  () {
                                setState(() {
                                  weight--; // Decrement weight
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kCardColour, // Color for the weight card
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
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
                                age++; // Increment age
                              });
                            }),
                            const SizedBox(
                              width: 14.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--; // Decrement age
                              });
                            })
                          ],
                        ),
                      ],
                    ),
                    colour: kCardColour, // Color for the age card
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            bottomContainerText: "CALCULATE",
            onPress: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(), // Pass calculated BMI
                    bmiText: calc.getResult(), // Pass BMI result text
                    interpretation: calc.getInterPretation(), // Pass BMI interpretation
                  ),
                ),
              );
            },
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

  final IconData icon; // Icon to be displayed on the button
  final VoidCallback onPressed; // Function to be called when the button is pressed

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 25.0,
      ),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 12.0,
      fillColor: const Color(0xFF8D8E98),
      onPressed: onPressed, // Call onPressed function when the button is pressed
    );
  }
}
