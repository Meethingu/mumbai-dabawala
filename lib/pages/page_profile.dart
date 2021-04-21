import 'dart:convert';

import 'package:Mumbai_Dabbawala/models/user.dart';
import 'package:Mumbai_Dabbawala/screens/screen_init.dart';
import 'package:Mumbai_Dabbawala/screens/screen_splash.dart';
import 'package:Mumbai_Dabbawala/services/auth.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PageProfile extends StatefulWidget {
  @override
  _PageProfileState createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile>
    with AutomaticKeepAliveClientMixin<PageProfile> {
  // User user;

  final AuthService _auth = AuthService();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.color_primary,
      statusBarColor: AppColors.color_primary,
    ));
    final prefs = await SharedPreferences.getInstance();
    // user = User.fromJson(json.decode(prefs.getString('user')));
  }

  void showUpdate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenInit(
            // phone: user.phone.substring(2),
            ),
      ),
    );
  }

  // void showWebView(String type) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => ScreenWebView(viewType: type),
  //     ),
  //   );
  // }

  Future<void> _launchKeyPad() async {
    const url = "tel:+7506551810";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchPrivacyPolicy(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> logout() async {
   
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ScreenSplash(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: <Widget>[
        Container(
          height: 48.0,
          padding: EdgeInsets.only(top: 8.0, left: 16.0),
          color: AppColors.color_primary,
          child: Text(
            "Profile",
            style: TextStyle(
              color: AppColors.color_white,
              fontSize: 22.0,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.color_white,
            boxShadow: [
              BoxShadow(
                color: AppColors.color_black,
                blurRadius: 2.0,
                offset: Offset(
                  0.2,
                  0.2,
                ),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  // user == null ? "" : user.name,
                  "Meet Hingu",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "PoppinsBold",
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_text_primary,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  // user == null ? "" : "${user.mail}\n+${user.phone}",
                  "7506551810",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    color: AppColors.color_text_assent,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "PoppinsBold",
                    fontWeight: FontWeight.bold,
                    color: AppColors.color_text_primary,
                  ),
                ),
                Text(
                  // user == null
                  //     ? ""
                  //     : "${user.address}\n${user.district}, ${user.state} - ${user.pincode}.",
                  "B-wing , Room No -04 , Natraj Appartment , Padwal Nagar , Thane - 400604",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    color: AppColors.color_text_assent,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.color_white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.color_primary,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.account_circle,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "My Account",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => showUpdate(),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.col_support_a,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.account_balance,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // onTap: () => showWebView("about"),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.col_support_b,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.mail,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // onTap: () => showWebView("contact"),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.col_support_a,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.call,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Call Help-Desk",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => _launchKeyPad(),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.col_support_b,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.info_outline,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // onTap: () => showWebView("terms"),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.col_support_c,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => _launchPrivacyPolicy(
                        "http://jugaadapp.microhind.com/privacy.html"),
                  ),
                  // TODO jugaad hata k dabbawala ka policy banana h
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.col_support_d,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 54,
                              width: 54,
                              child: Center(
                                child: Icon(
                                  Icons.exit_to_app,
                                  color: AppColors.color_white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins",
                                color: AppColors.color_text_primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => logout(),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive {
    return true;
  }
}
