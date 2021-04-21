import 'dart:convert';
import 'package:Mumbai_Dabbawala/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import '../models/order.dart';

import '../values/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageOrders extends StatefulWidget {
  @override
  _PageOrdersState createState() => _PageOrdersState();
}

class _PageOrdersState extends State<PageOrders>
    with AutomaticKeepAliveClientMixin<PageOrders> {
  Users user;
  List<Order> orders;

  @override
  void initState() {
    super.initState();
    // loadData();
  }

  // Future<void> loadData() async {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     systemNavigationBarColor: AppColors.color_primary,
  //     statusBarColor: AppColors.color_primary,
  //   ));

  //   final prefs = await SharedPreferences.getInstance();
  //   user = User.fromJson(json.decode(prefs.getString('user')));

  //   var res = await http.get(
  //       "http://jugaadapp.microhind.com/apib/api.php?get_order=${user.phone}");
  //   orders = orderFromJson(res.body);
  //   setState(() {});
  // }

  Color getStatusColor(String status) {
    switch (status) {
      case "0":
        return AppColors.color_primary;
      case "1":
        return AppColors.col_support_b;
      case "2":
        return AppColors.col_support_c;
      case "3":
        return AppColors.col_support_a;
      case "4":
        return AppColors.col_support_f;
      default:
        return AppColors.color_primary;
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case "0":
        return "Open";
      case "1":
        return "Approved";
      case "2":
        return "Dispatched";
      case "3":
        return "Completed";
      case "4":
        return "Cancelled";
      default:
        return "Open";
    }
  }

  // void gotoOrder(String id, String sts) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => ScreenOrderLog(
  //         oid: id,
  //         status: sts,
  //       ),
  //     ),
  //   );
  // }

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
            "Orders",
            style: TextStyle(
              color: AppColors.color_white,
              fontSize: 22.0,
            ),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Order History",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: AppColors.color_text_primary,
            ),
          ),
        ),
        orders == null
            ? Container(
                margin: EdgeInsets.all(22.0),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/empty.png'),
                      width: 80,
                      height: 80,
                    ),
                    Text("No orders yet.")
                  ],
                ),
              )
            : orders.length <= 0
                ? Container(
                    margin: EdgeInsets.all(22.0),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/empty.png'),
                          width: 80,
                          height: 80,
                        ),
                        Text("No orders yet.")
                      ],
                    ),
                  )
                : Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 12.0),
                          child: GestureDetector(
                            child: Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: AppColors.color_white,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "${orders[index].code}",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                color: AppColors
                                                    .color_text_primary,
                                              ),
                                            ),
                                            Text(
                                              "${orders[index].dateTime.toString().substring(0, 10)}",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    AppColors.color_text_assent,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${orders[index].orderTotal}",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.color_black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: AppColors.color_text_primary,
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 12.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          getStatusText(
                                              "${orders[index].status}"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            color: getStatusColor(
                                                "${orders[index].status}"),
                                          ),
                                        ),
                                        Text(
                                          "Order Details",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            color: AppColors.col_support_b,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // onTap: () => gotoOrder(
                            //     orders[index].id, orders[index].status),
                          ),
                        );
                      },
                    ),
                  ),
      ],
    );
  }

  @override
  bool get wantKeepAlive {
    return true;
  }
}
