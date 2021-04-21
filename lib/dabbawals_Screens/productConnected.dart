import 'package:Mumbai_Dabbawala/pages/tracking.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductConnected extends StatefulWidget {
  @override
  _ProductConnectedState createState() => _ProductConnectedState();
}

class _ProductConnectedState extends State<ProductConnected> {
  var productList = [
    {
      "name": "Meet Hingu",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Mulund",
      "deliveryaddress": "Delivery Address - Ghatkopar",
    },
    {
      "name": "Dweej Khotari",
      "picture": "assets/images/retailerlogo.png",
      "pickupaddress": "PickUp Address - Borivali",
      "deliveryaddress": "Delivery Address - Malad",
    },
    {
      "name": "Sanket More",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Parel",
      "deliveryaddress": "Delivery Address - Dadar",
    },
    {
      "name": "Aayush Shah",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Vikhroli",
      "deliveryaddress": "Delivery Address - Ghatkopar",
    },
    {
      "name": "Vrushal Gogari",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Thane",
      "deliveryaddress": "Delivery Address - Sion",
    },
    {
      "name": "Parag Hatim",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Chembur",
      "deliveryaddress": "Delivery Address - Mankhurd",
    },
    {
      "name": "Pranay DHotre",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Govandi",
      "deliveryaddress": "Delivery Address - Kalyan",
    },
    {
      "name": "Viral Wani",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Mira Road",
      "deliveryaddress": "Delivery Address - Dahisar",
    },
    {
      "name": "Deep Nandu",
      "picture": "assets/images/traderlogo.png",
      "pickupaddress": "PickUp Address - Mulund",
      "deliveryaddress": "Delivery Address - Ghatkopar",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]["name"],
          productPicture: productList[index]["picture"],
          productPickUpAddress: productList[index]["pickupaddress"],
          productDeliveryAddress: productList[index]["deliveryaddress"],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productPickUpAddress;
  final productDeliveryAddress;

  SingleProduct(
      {this.productName,
      this.productPicture,
      this.productPickUpAddress,
      this.productDeliveryAddress});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 200,
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.green,
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.maps_ugc,
                                color: Colors.green,
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Tracking(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Container(
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      productPickUpAddress,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      productDeliveryAddress,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Sent to ID - 101",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
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
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("Done"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              Center(
                child: Container(
                  padding: EdgeInsetsDirectional.only(top: 10),
                  height: 50,
                  width: 86,
                  child: Image.asset(productPicture),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            productName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            productPickUpAddress,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            productDeliveryAddress,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30.0,
              width: 120.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.color_primary,
                  width: 3,
                ),
              ),
              child: Center(
                child: Text(
                  "PickUp",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30.0,
              width: 120.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.color_primary,
                  width: 3,
                ),
              ),
              child: Center(
                child: Text(
                  "Delivery",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
