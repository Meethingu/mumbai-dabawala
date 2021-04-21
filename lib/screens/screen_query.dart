import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import 'screen_category.dart';
import 'screen_dabbawala.dart';

class ScreenQuery extends StatefulWidget {
  @override
  _ScreenQueryState createState() => _ScreenQueryState();
}

class _ScreenQueryState extends State<ScreenQuery> {
  // DatabaseHelper databaseHelper = new DatabaseHelper();

  gotoCategory(String id, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenCategory(
          cid: id,
          title: title,
        ),
      ),
    );
  }

  gotoJugaadScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ScreenDabbawala(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 60.0,
              color: AppColors.color_primary,
              child: Center(
                child: Text(
                  "Mumbai Dabbawala",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: AppColors.color_white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.color_bg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12),
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.color_text_assent,
                        borderRadius: BorderRadius.circular(4)),
                    child: null,
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/imgb.png"),
                    onTap: () => gotoCategory('5', 'Offers'),
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/imga.png"),
                    onTap: () => gotoJugaadScreen(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
