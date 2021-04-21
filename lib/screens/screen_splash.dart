import 'dart:async';

import 'package:Mumbai_Dabbawala/screens/screen_auth.dart';
import 'package:flutter/material.dart';
import '../values/app_colors.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'screen_home.dart';

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      screenAuth,
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  Future<void> onDoneLoading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenHome()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenAuth()),
      );
    }
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      content: Text("Offer is not available."),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('SHOW'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  void _showItemDialog(Map<String, dynamic> message) {
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(context),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        _navigateToItemDetail(message);
      }
    });
  }

  void _navigateToItemDetail(Map<String, dynamic> message) {
    //Todo Navigate to sertain diglog as per the notification
    /*final Item item = _itemForMessage(message);
    // Clear away dialogs
    Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
    if (!item.route.isCurrent) {
      Navigator.push(context, item.route);
    }*/
  }

  @override
  Future<void> inistate() async {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToItemDetail(message);
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
      setState(() {});
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          width: double.infinity,
          color: AppColors.color_white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.color_primary, // set border color
                        width: 1.0), // set border width
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ), // set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          color: AppColors.color_primary,
                          offset: Offset(1, 1))
                    ] // make rounded corner of border
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 26.0,
                        color: AppColors.color_text_primary,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Digital Dabbawala!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.color_primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Image(
                image: AssetImage('assets/images/logo.jpg'),
                width: 300,
                height: 250,
              ),
              Expanded(
                child: Container(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.color_primary, // set border color
                        width: 1.0), // set border width
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ), // set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          color: AppColors.color_primary,
                          offset: Offset(1, 1))
                    ] // make rounded corner of border
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 26.0,
                        color: AppColors.color_text_primary,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome to Dabbawala!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.color_primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80.0),
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.color_bg,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.color_primary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void screenAuth() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenAuth(),
      ),
    );
  }
}
