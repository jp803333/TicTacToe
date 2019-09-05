import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'UserName',
                ),
                keyboardType: TextInputType.text,
                controller: _username,
              ),
            ),
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'email',
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
            ),
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(hintText: 'password'),
                obscureText: true,
                controller: _password,
              ),
            ),
            FlatButton(
              child: Text('SignUp'),
              splashColor: Theme.of(context).accentColor,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _email.text, password: _password.text)
                    .then((result) {
                  print(result.user.uid);
                  Firestore.instance
                      .document('Users/' + result.user.uid)
                      .updateData({
                    'name': _username.text,
                  }).then((_) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                }).catchError((e) {
                  Navigator.pop(context);
                  print(e);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
