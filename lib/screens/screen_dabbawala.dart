import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:flutter/material.dart';

class ScreenDabbawala extends StatefulWidget {
  @override
  _ScreenDabbawalaState createState() => _ScreenDabbawalaState();
}

class _ScreenDabbawalaState extends State<ScreenDabbawala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_bg,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 60.0,
              child: Center(
                child: Text(
                  "Dabbawala hai!",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: AppColors.color_primary,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
