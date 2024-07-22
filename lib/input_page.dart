import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 90.0;
const bottomContainerColour = Color(0xFFF4EEE0);
const cardColour = Color(0xFF141218);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
          const Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars, label: "MALE",
                ),
                colour: cardColour,
              ),),
              Expanded(child: ReusableCard(
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus, label: "FEMALE",
                ),
                colour: cardColour,
              ),),
            ],
          )),
          const Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                colour: cardColour,
              ),)
            ],
          )),
          const Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                colour: cardColour,
              ),),
              Expanded(child: ReusableCard(
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

