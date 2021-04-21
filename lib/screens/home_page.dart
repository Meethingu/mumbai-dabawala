import 'package:Mumbai_Dabbawala/screens/screen_init.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:Mumbai_Dabbawala/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:animate_do/animate_do.dart';
import 'package:Mumbai_Dabbawala/json/home_page_json.dart';
import 'package:Mumbai_Dabbawala/theme/colors.dart';
import 'package:Mumbai_Dabbawala/theme/styles.dart';

import 'store_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int activeMenu = 0;
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
              children: List.generate(menu.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        activeMenu = index;
                      });
                    },
                    child: activeMenu == index
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
                                      menu[index],
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
                                  GestureDetector(
                                    child: Text(
                                      menu[index],
                                      style: customContent,
                                    ),
                                    onTap: () {
                                      return showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Container(
                                            height: 70,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Dabbawalas Name - Mohan Pawar :",
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontFamily: "Poppins",
                                                      ),
                                                    ),
                                                    // TextField(
                                                    //   decoration: InputDecoration(
                                                    //       hintText: 'Enter a search term'),
                                                    // ),
                                                  ],
                                                ),
                                                Text(
                                                  "Phone No - 7506551810",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "Poppins",
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "ID - 101",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "Poppins",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            FlatButton(
                                              onPressed: () => _launchKeyPad(),
                                              child: Text("Call"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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
        CustomSliderWidget(
          items: [
            "assets/images/slide_1.jpg",
            "assets/images/slide_2.jpg",
            "assets/images/slide_3.jpg"
          ],
        ),
        Container(
          width: size.width,
          decoration: BoxDecoration(color: textFieldColor),
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(color: white),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Row(
                        children: List.generate(categories.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              categories[index]['img'],
                              width: 40,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              categories[index]['name'],
                              style: customParagraph,
                            )
                          ],
                        ),
                      );
                    })),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StoreDetailPage(
                                      img: firstMenu[0]['img'],
                                    )));
                      },
                      child: Container(
                        width: size.width,
                        height: 160,
                        child: Image(
                          image: NetworkImage(firstMenu[0]['img']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: SvgPicture.asset(
                        firstMenu[0]['is_liked']
                            ? "assets/images/loved_icon.svg"
                            : "assets/images/love_icon.svg",
                        width: 20,
                        color: white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  firstMenu[0]['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Sponsored",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      firstMenu[0]['description'],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: textFieldColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.hourglass_bottom,
                          color: primary,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textFieldColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          firstMenu[0]['time'],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textFieldColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          firstMenu[0]['delivery_fee'],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width,
          height: 10,
          decoration: BoxDecoration(color: textFieldColor),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "More to explore",
                style: customTitle,
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(exploreMenu.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => StoreDetailPage(
                                              img: exploreMenu[index]['img'])));
                                },
                                child: Container(
                                  width: size.width - 30,
                                  height: 160,
                                  child: Image(
                                    image:
                                        NetworkImage(exploreMenu[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: SvgPicture.asset(
                                  exploreMenu[index]['is_liked']
                                      ? "assets/images/loved_icon.svg"
                                      : "assets/images/love_icon.svg",
                                  width: 20,
                                  color: white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            exploreMenu[index]['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "Sponsored",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.info,
                                color: Colors.grey,
                                size: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                exploreMenu[index]['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.hourglass_bottom,
                                    color: primary,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    exploreMenu[index]['time'],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        exploreMenu[index]['rate'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: yellowStar,
                                        size: 17,
                                      ),
                                      Text(
                                        exploreMenu[index]['rate_number'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width,
          height: 10,
          decoration: BoxDecoration(color: textFieldColor),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Near You",
                style: customTitle,
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(popluarNearYou.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => StoreDetailPage(
                                              img: popluarNearYou[index]
                                                  ['img'])));
                                },
                                child: Container(
                                  width: size.width - 30,
                                  height: 160,
                                  child: Image(
                                    image: NetworkImage(
                                        popluarNearYou[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: SvgPicture.asset(
                                  popluarNearYou[index]['is_liked']
                                      ? "assets/images/loved_icon.svg"
                                      : "assets/images/love_icon.svg",
                                  width: 20,
                                  color: white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            popluarNearYou[index]['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "Sponsored",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.info,
                                color: Colors.grey,
                                size: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                popluarNearYou[index]['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.hourglass_bottom,
                                    color: primary,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    popluarNearYou[index]['time'],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        popluarNearYou[index]['rate'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: yellowStar,
                                        size: 17,
                                      ),
                                      Text(
                                        popluarNearYou[index]['rate_number'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

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

  canLaunch(String url) {}

  launch(String url) {}
}
