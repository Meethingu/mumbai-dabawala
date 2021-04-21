import 'package:Mumbai_Dabbawala/values/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:animate_do/animate_do.dart';
import 'package:Mumbai_Dabbawala/json/home_page_json.dart';
import 'package:Mumbai_Dabbawala/theme/colors.dart';
import 'package:Mumbai_Dabbawala/theme/styles.dart';

import 'productConnected.dart';

class DabawalaHomePage extends StatefulWidget {
  @override
  _DabawalaHomePageState createState() => _DabawalaHomePageState();
}

class _DabawalaHomePageState extends State<DabawalaHomePage> {
  int count = 0;
  int activedabawala = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.0,
              padding: EdgeInsets.only(top: 30.0, left: 16.0),
              decoration: BoxDecoration(
                color: AppColors.color_primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(18.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 24.0,
                            color: AppColors.color_white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Welcome to\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            TextSpan(
                              text: 'Mumbai Dabbawala',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: MyRichText(
                      //     text: "$mssg",
                      //     style: TextStyle(
                      //       fontSize: 24.0,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 18.0),
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: AppColors.color_white,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.color_text_primary,
                                ),
                              ),
                            ),
                            count > 0
                                ? Positioned(
                                    right: 4,
                                    top: 4,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 18.0),
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        color: AppColors.col_support_e,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$count",
                                          style: TextStyle(
                                            fontSize: 6,
                                            fontFamily: "Poppins",
                                            color: AppColors.color_white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        // onTap: () => gotoCart(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(dabawala.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        activedabawala = index;
                      });
                    },
                    child: activedabawala == index
                        ? ElasticIn(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.color_primary,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 8, bottom: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      dabawala[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    menu[index],
                                    style: customContent,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  height: 45,
                  width: size.width - 70,
                  decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/pin_icon.svg",
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Mumbai", style: customContent)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/time_icon.svg",
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Now",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SvgPicture.asset("assets/images/filter_icon.svg"),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 700,
                child: ProductConnected(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
