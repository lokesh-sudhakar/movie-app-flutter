import 'package:flutter/material.dart';
import 'package:moviejunction/locator.dart';
import 'screens/home/home_screen.dart';

void main()  {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

