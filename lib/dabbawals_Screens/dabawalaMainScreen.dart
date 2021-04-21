import 'dart:io';
import 'dart:convert';

import 'package:Mumbai_Dabbawala/pages/page_home.dart';
import 'package:Mumbai_Dabbawala/pages/page_orders.dart';

import 'package:Mumbai_Dabbawala/pages/page_profile.dart';

import 'package:Mumbai_Dabbawala/pages/tracking.dart';
import 'package:Mumbai_Dabbawala/screens/home_page.dart';
import 'package:Mumbai_Dabbawala/screens/screen_query.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../values/app_colors.dart';

import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dabawalaHomePage.dart';

class DabawalaMainScreen extends StatefulWidget {
  @override
  _DabawalaMainScreenState createState() => _DabawalaMainScreenState();
}

class _DabawalaMainScreenState extends State<DabawalaMainScreen> {
  int _pageIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Widget buildPagerView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        DabawalaHomePage(),
        Tracking(),
        PageOrders(),
        PageProfile(),
      ],
    );
  }

  gotoQuery() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenQuery(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // checkVersion();
  }

  // Future<void> checkVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String version = packageInfo.version;

  //   final prefs = await SharedPreferences.getInstance();
  //   User user = User.fromJson(json.decode(prefs.getString('user')));

  //   var block = await http.get(
  //       "http://erricfashion.microhind.com/apib/api.php?get_bstatus=${user.id}");

  //   var ver = await http
  //       .get("http://erricfashion.microhind.com/apib/api.php?get_version");

  //   print(version);
  //   if (block.body == "1") {
  //     showBlockDialog();
  //   } else {
  //     if (ver.body != version) {
  //       showLoadingDialog();
  //     }
  //   }
  // }

  Future<void> showLoadingDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            backgroundColor: AppColors.color_white,
            contentPadding: EdgeInsets.all(14),
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(
                      "New update is available.",
                      style: TextStyle(
                        color: AppColors.color_text_primary,
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Newer version of application is now live please update the application for seamless operation.",
                      style: TextStyle(
                        color: AppColors.color_text_assent,
                        fontSize: 14,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.color_primary,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: AppColors.color_white,
                                fontSize: 14,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => gotoPlay(),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> showBlockDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            backgroundColor: AppColors.color_white,
            contentPadding: EdgeInsets.all(14),
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(
                      "Account Blocked.",
                      style: TextStyle(
                        color: AppColors.color_text_primary,
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Your Account has been blocked by admin please contact our support for further information.",
                      style: TextStyle(
                        color: AppColors.color_text_assent,
                        fontSize: 14,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.color_primary,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Exit",
                              style: TextStyle(
                                color: AppColors.color_white,
                                fontSize: 14,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => exit(0),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_bg,
      body: buildPagerView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.color_white,
        onPressed: () {},
        child: GestureDetector(
          child: Container(
            width: 54,
            height: 54,
            child: Center(
              child: FlareActor(
                "assets/images/logo.png",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "idle",
              ),
            ),
          ),
          onTap: () => gotoQuery(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: "Poppins",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc_outlined),
            title: Text(
              'Tracking',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: "Poppins",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_basket),
            title: new Text(
              'History',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: "Poppins",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: "Poppins",
              ),
            ),
          )
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
      ),
    );
  }

  gotoPlay() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String pcName = packageInfo.packageName;
    String url = "https://play.google.com/store/apps/details?id=${pcName}";
    if (await canLaunch(url)) {
      await launch(url);
      exit(0);
    } else {
      throw 'Could not launch $url';
    }
  }
}
