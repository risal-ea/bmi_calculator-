import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  // Constructor for IconContent class
  const IconContent({
    super.key,
    this.icon = Icons.info_outline, // Default icon is info_outline
    this.label = "", // Default label is an empty string
  });

  final IconData icon; // Icon to be displayed
  final String label; // Text label to be displayed below the icon

  @override
  Widget build(BuildContext context) {
    return Column(
      // Arranges children in a vertical column
      mainAxisAlignment: MainAxisAlignment.center, // Centers children vertically within the column
      children: [
        Icon(
          icon, // Icon to display
          size: 80.0, // Size of the icon
        ),
        SizedBox(
          height: 15.0, // Space between the icon and the label
        ),
        Text(
            label, // Text label to display
            style: kLabelTextStyle // Style applied to the label text
        ),
      ],
    );
  }
}
