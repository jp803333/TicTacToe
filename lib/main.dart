import 'package:flutter/material.dart';
import 'package:tictactoe/Screens/HomeScreen.dart';
import 'package:tictactoe/Screens/LoadingScreen.dart';
import 'package:tictactoe/Screens/LoginScreen.dart';
import 'package:tictactoe/Screens/SignUpScreen.dart';
import 'package:tictactoe/Screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TicTacToe',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        backgroundColor: Colors.white,
        ),
      routes: {
        '/': (context) => SplashScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/loginscreen': (context) => LoginScreen(),
        '/signupscreen': (context) => SignUpScreen(),
        '/loadingscreen': (context) => LoadingScreen(),
        // '/gamescreen':(context)=>GameScreen(),
      },
    );
  }
}
