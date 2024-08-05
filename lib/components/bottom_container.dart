import 'package:flutter/material.dart';
import '../constants.dart';

class BottomContainer extends StatelessWidget {
  // Constructor for BottomContainer class
  const BottomContainer({
    super.key,
    required this.bottomContainerText, // Text to display in the container
    required this.onPress, // Callback function to be called on tap
  });

  final String bottomContainerText; // The text to display in the container
  final void Function() onPress; // Callback function when the container is tapped

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Detects gestures such as taps
      onTap: onPress, // Executes the callback function when the container is tapped
      child: Container(
        alignment: Alignment.center, // Centers the text inside the container
        color: kBottomContainerColour, // Background color of the container
        margin: EdgeInsets.only(top: 10), // Margin from the top
        height: kBottomContainerHeight, // Height of the container
        width: double.infinity, // Container width stretches to the full width of its parent
        padding: EdgeInsets.only(bottom: 18.0), // Padding at the bottom
        child: Text(
          bottomContainerText, // The text to display inside the container
          style: kCalculateButton, // Style applied to the text
        ),
      ),
    );
  }
}
