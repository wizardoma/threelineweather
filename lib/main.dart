import 'package:flutter/material.dart';
import 'package:threelineweather/ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ThreeLine Weather",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );

  }
}
