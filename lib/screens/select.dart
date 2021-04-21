import 'package:Mumbai_Dabbawala/dabbawals_Screens/dabawalaMainScreen.dart';
import 'package:Mumbai_Dabbawala/screens/home_page.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'screen_home.dart';

class Select extends StatefulWidget {
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 300),
          child: Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                    child: new Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: AppColors.color_primary,
                      )),
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DabawalaMainScreen(),
                      ),
                    ),
                  ),
                  Text(
                    "Join As Dabawala",
                    style: TextStyle(
                      color: AppColors.color_primary,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Column(
                children: [
                  new Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: AppColors.color_primary,
                    )),
                    child: GestureDetector(
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/user.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScreenHome(),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Join As User",
                    style: TextStyle(
                      color: AppColors.color_primary,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
