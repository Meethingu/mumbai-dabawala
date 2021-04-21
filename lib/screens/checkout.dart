import 'package:Mumbai_Dabbawala/screens/trackorder.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: ListView(
          children: <Widget>[
            Container(
              height: 48.0,
              padding: EdgeInsets.only(top: 8.0, left: 16.0),
              color: AppColors.color_primary,
              child: Row(
                children: [
                  IconButton(
                    icon: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          size: 18,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "CheckOut",
                    style: TextStyle(
                      color: AppColors.color_white,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                color: AppColors.color_bg,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.color_black,
                        blurRadius: 8.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 22.0,
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Biling Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "Meet Hingu",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "+7506551810",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "PickUp Address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "A/702 Natraj App, Padwal Nagar",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "Thane - 400604",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "Delievery Address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "A/702 Natraj App, Padwal Nagar",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Text(
                                "Thane - 400604",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                color: AppColors.color_bg,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.color_black,
                        blurRadius: 8.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 22.0,
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "InVoice Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Price (Item 2)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "Rs 900",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Tax (0 %)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "Rs 0",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "TOTAL",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "Rs 900",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 16.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                color: AppColors.color_bg,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.color_black,
                        blurRadius: 8.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 22.0,
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Payment Mode",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                // Text(
                                //   "TOTAL",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 16.0,
                                //     fontFamily: "Poppins",
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),

                                Text(
                                  "UPI",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // Text(
                                //   "TOTAL",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 16.0,
                                //     fontFamily: "Poppins",
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),

                                Text(
                                  "COD (Cash on deilvery)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: AppColors.color_primary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Text(
                    "CheckOut",
                    style: TextStyle(
                      color: AppColors.color_white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrackOrder(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
