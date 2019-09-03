import 'package:flutter/material.dart';
import 'package:tictactoe/Screens/HomeScreen.dart';
import 'package:tictactoe/Screens/LoginScreen.dart';
import 'package:tictactoe/Screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'TicTacToe', initialRoute: '/', routes: {
      '/': (context) => SplashScreen(),
      '/homescreen':(context)=>HomeScreen(),
      '/loginscreen':(context)=>LoginScreen(),
      // '/gamescreen':(context)=>GameScreen(),
    });
  }
}
