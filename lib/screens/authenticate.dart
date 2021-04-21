import 'package:Mumbai_Dabbawala/screens/Login.dart';
import 'package:Mumbai_Dabbawala/screens/screen_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return ScreenAuth(toggleView: toggleView);
    } else {
      return Login(toggleView: toggleView);
    }
  }
}
