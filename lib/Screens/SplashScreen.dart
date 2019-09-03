import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      if (user != null) {
        Navigator.popAndPushNamed(context, '/homescreen');
      } else {
        Navigator.popAndPushNamed(context, '/loginscreen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('loading'),
      ),
    );
  }
}
