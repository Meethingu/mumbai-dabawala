import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: ListView(
          children: [
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
                    "Track Order",
                    style: TextStyle(
                      color: AppColors.color_white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                _label("Order Placed", "2020 - 03 - 03", "Order Placed"),
                _label("Order Approved", "2020 - 03 - 03",
                    "Order Approved processing for dispatch"),
                _label("Order Dispatched", "2020 - 03 - 03",
                    "Order has been sent for delivery"),
                _label("Order Completed", "2020 - 03 - 03",
                    "Order Completed . Thank You!"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _label(String order, String date, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Container(
      color: AppColors.color_bg,
      child: Container(
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
            top: 8.0,
            bottom: 8.0,
            right: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          order,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
