import 'package:flutter/material.dart';
import 'package:moviejunction/screens/home_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Junction',
      theme: ThemeData(
        primaryColor: Color(0xFF151C26),
        primaryColorLight: Color(0xFF5a606b),
        accentColor: Color(0xFFf4C10F),
        appBarTheme: AppBarTheme(
          color: Color(0xFF151C26),
          textTheme: TextTheme(
            display1: TextStyle(fontSize: 20, color: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        primaryTextTheme: TextTheme(
          display1: TextStyle(fontSize: 20, color: Colors.white),
          display2: TextStyle(fontSize: 20, color: Color(0xFF5a606b)),
        )
      ),
      home: HomeScreen(),
    );
  }
}

