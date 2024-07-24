import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 90.0;
const bottomContainerColour = Color(0xFFF4EEE0);
const cardColour = Color(0xFF141218);
const inactiveCardColour = Color(0xFF2D3250);

enum Gender{
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
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableCard(
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars, label: "MALE",
                  ),
                  colour: selectedGender == Gender.male? cardColour : inactiveCardColour,
                ),
              ),),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus, label: "FEMALE",
                  ),
                  colour: selectedGender == Gender.female? cardColour : inactiveCardColour,
                ),
              ),),
            ],
          )),
           Expanded(child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    print("center card is clicked");
                  },
                  child: ReusableCard(
                    cardChild: IconContent(),
                    colour: cardColour,
                                ),
                ),),
            ],
          )),
          const Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                cardChild: IconContent(),
                colour: cardColour,
              ),),
              Expanded(child: ReusableCard(
                cardChild: IconContent(),
                colour: cardColour,
              ),),
            ],
          )),
          Container(
            color: bottomContainerColour,
            margin: const EdgeInsets.only(top: 10),
            height: bottomContainerHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

