import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
                  hintText: 'email',
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
            ),
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'password'
                ),
                obscureText: true,
                controller: _password,
              ),
            ),
            FlatButton(
              child: Text('login'),
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
                FirebaseAuth auth = FirebaseAuth.instance;
                FirebaseUser user = await auth
                    .signInWithEmailAndPassword(
                        email: _email.text, password: _password.text)
                    .then((auth) {
                  return auth.user;
                }).catchError((e) {
                  print(e);
                });
                if (user != null) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/homescreen');
                }
              },
            ),
            InkWell(
              child: Text("SignUp"),
              onTap: (){
                Navigator.pushNamed(context, '/signupscreen');
              },
            )
          ],
        ),
      ),
    );
  }
}
