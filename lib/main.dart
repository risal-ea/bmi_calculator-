import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF222831),
      ),

      //Routes
      home: InputPage(),

      // initialRoute: '/',
      // routes: {
      //   '/' : (context) => InputPage(),
      //   '/result' : (context) => ResultPage(),
      // },
    );
  }
}
