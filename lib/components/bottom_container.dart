import 'package:flutter/material.dart';
import '../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.bottomContainerText,
    required this.onPress,
  });

  final String bottomContainerText;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        color: kBottomContainerColour,
        margin:  EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 18.0),
        child:  Text(
          bottomContainerText,
          style: kCalculateButton,
        ),
      ),
    );
  }
}
