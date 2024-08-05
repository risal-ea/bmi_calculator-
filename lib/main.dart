import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner in the top-right corner

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF222831), // Sets the background color of the scaffold
      ),

      // Set the initial route for the application
      home: InputPage(), // The home screen of the app

      // Uncomment and define named routes if needed
      /*
      initialRoute: '/', // The initial route when the app starts
      routes: {
        '/': (context) => InputPage(), // Route for the InputPage
        '/result': (context) => ResultPage(), // Route for the ResultPage
      },
      */
    );
  }
}
