import 'dart:convert';

import 'package:Mumbai_Dabbawala/screens/screen_home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/data/locations.dart';

import '../models/user.dart';
import 'screen_splash.dart';

import '../values/app_colors.dart';

import '../widgets/AppText.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'select.dart';

class ScreenInit extends StatefulWidget {
  final String phone;

  const ScreenInit({Key key, this.phone}) : super(key: key);

  @override
  _ScreenInitState createState() => _ScreenInitState();
}

class _ScreenInitState extends State<ScreenInit> {
  List<String> _accountType = ['User', 'Dabbawala', 'Admin']; // Option 2
  String _selectedaccountType;

  List<String> _subscriptionType = ['Montly', '3 Months', 'Year']; // Option 2
  String _selectedSubscriptionType;

  List<String> _pincodeType = [
    '400601',
    '400602',
    '400603',
    '400604',
    '400605',
    '400606'
  ]; // Option 2
  String _selectedPincodeType;

  List<String> _cityType = [
    'Chembur',
    'Borivali',
    'Thane',
    'Mulund',
    'Malad',
    'Bandup',
    'Parel',
    'Vikhroli',
    'Ghatkopar',
    'kurla',
    'dadar',
    'parel',
  ]; // Option 2
  String _selectedcityType;

  List<String> _stateType = [
    'Maharashtra',
  ]; // Option 2
  String _selectedstateType;

  final _formInit = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  Locations locations;

  List<DropdownMenuItem> citys = [];
  List<DropdownMenuItem> pincodes = [];

  var txtA = TextEditingController();
  var txtB = TextEditingController();
  var txtC = TextEditingController();

  Users user;

  String name, email, address, sstate, city, pincode;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      // _showDig();
      // loadData();
    });
  }

  // _showDig() {
  //   Dialogs.showLoadingDialog(context, _keyLoader);
  // }

  // Future<String> LoadJsonfromAssets() async {
  //   return await rootBundle.loadString("assets/data/state.json");
  // }

  // Future<void> loadData() async {
  //   String jsonString = await LoadJsonfromAssets();
  //   final jsonResponse = json.decode(jsonString);
  //   locations = new Locations.fromJson(jsonResponse);

  //   var connection = await Connectivity().checkConnectivity();
  //   if (connection == ConnectivityResult.none) {
  //     setState(() {});
  //   } else {
  //     var res = await http.get(
  //         "http://erricfashion.microhind.com/apib/api.php?user_phone=91" +
  //             widget.phone);
  //     if (res.statusCode == 200) {
  //       var serverRes = res.body.substring(1, res.body.length - 1);
  //       if (serverRes.length >= 2) {
  //         user = User.fromJson(jsonDecode(serverRes));

  //         if (user.phone.isNotEmpty) {
  //           txtA.text = user.name;
  //           txtB.text = user.mail;
  //           txtC.text = user.address;
  //           sstate = user.state;
  //           onValChangeState(user.state);
  //         }
  //       }

  //       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

  //       setState(() {});
  //     } else {
  //       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  //       setState(() {});
  //       throw Exception('Failed to load user');
  //     }
  //   }
  // }

  // Future<void> submit(BuildContext context) async {
  //   if (_formInit.currentState.validate()) {
  //     // _showDig();
  //     _formInit.currentState.save();

  //     final prefs = await SharedPreferences.getInstance();
  //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //     user = new User();
  //     user.name = name;
  //     user.mail = email;
  //     user.phone = "91${widget.phone}";
  //     user.address = address;
  //     user.state = sstate;
  //     user.district = city;
  //     user.pincode = pincode;
  //     user.userType = "user";
  //     user.gstn = "";
  //     user.pan = "";
  //     user.userVersion = packageInfo.version;

  //     final res = await http.post(
  //         "http://erricfashion.microhind.com/apib/api.php?add_user",
  //         body: {
  //           "name": user.name,
  //           "email": user.mail,
  //           "phone": user.phone,
  //           "address": user.address,
  //           "state": user.state,
  //           "district": user.district,
  //           "pincode": user.pincode,
  //           "user_type": user.userType,
  //           "gstn": user.gstn,
  //           "pan": user.pan,
  //           "version": user.userVersion
  //         });

  //     if (res.body == "Try Again") {
  //       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  //       showDialog<void>(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (BuildContext context) {
  //           return SimpleDialog(
  //             backgroundColor: AppColors.color_white,
  //             children: <Widget>[
  //               Center(
  //                 child: Column(children: [
  //                   CircularProgressIndicator(),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Text(
  //                     "Server Error please try again!",
  //                     style: TextStyle(color: AppColors.color_primary),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Container(
  //                     width: 20.0,
  //                     height: 20.0,
  //                     color: AppColors.color_primary,
  //                     child: Padding(
  //                       padding: EdgeInsets.all(8.0),
  //                       child: Text("ok"),
  //                     ),
  //                   )
  //                 ]),
  //               )
  //             ],
  //           );
  //         },
  //       );
  //     } else {
  //       user.id = res.body;
  //       prefs.setString('user', json.encode(user));
  //       Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => ScreenSplash()),
  //       );
  //     }
  //   }
  // }

  onValChangeState(newValue) {
    sstate = newValue;
    citys.clear();
    locations.district.forEach((k, v) {
      if (v.state.toLowerCase() == sstate.toLowerCase()) {
        citys.add(DropdownMenuItem(
          child: Text(k),
          value: k,
        ));
      }
    });
    if (user != null) {
      // city = user.district;
      onValChangeCity(city);
    }
    setState(() {});
  }

  onValChangeCity(newValue) {
    city = newValue;
    pincodes.clear();
    locations.district[city].pinCodes.forEach((pin) => {
          pincodes.add(DropdownMenuItem(
            child: Text(pin.toString()),
            value: pin.toString(),
          ))
        });
    if (user != null) {
      // pincode = user.pincode;
      onValChangePincode(pincode);
    }
    setState(() {});
  }

  onValChangePincode(newValue) {
    pincode = newValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_white,
      appBar: AppBar(
        backgroundColor: AppColors.color_primary,
        title: AppText(
          "Profile",
          "Poppins",
          20.0,
          false,
          AppColors.color_white,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: AppText(
              "Update your profile",
              "PoppinsBold",
              26.0,
              true,
              AppColors.color_text_primary,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Form(
              key: _formInit,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: txtA,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.color_text_primary,
                    ),
                    decoration: InputDecoration(labelText: "Enter name"),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },
                    onSaved: (input) => name = input,
                  ),
                  TextFormField(
                    controller: txtB,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.color_text_primary,
                    ),
                    decoration: InputDecoration(labelText: "Enter email"),
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email.';
                      }
                      return null;
                    },
                    onSaved: (input) => email = input,
                  ),
                  TextFormField(
                    controller: txtC,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.color_text_primary,
                    ),
                    decoration: InputDecoration(labelText: "Enter address"),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your address.';
                      }
                      return null;
                    },
                    onSaved: (input) => address = input,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  DropdownButtonFormField(
                    hint: Text(
                      "Select State",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: AppColors.color_text_primary,
                      ),
                    ),
                    value: _selectedstateType,
                    items: _stateType.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedstateType = newValue;
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text(
                      "Select Pincode",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: AppColors.color_text_primary,
                      ),
                    ),
                    value: _selectedcityType,
                    items: _cityType.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedcityType = newValue;
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text(
                      "Select Pincode",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: AppColors.color_text_primary,
                      ),
                    ),
                    value: _selectedPincodeType,
                    items: _pincodeType.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPincodeType = newValue;
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text(
                      "Account Type",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: AppColors.color_text_primary,
                      ),
                    ),
                    value: _selectedaccountType,
                    items: _accountType.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedaccountType = newValue;
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    hint: Text(
                      "Subscription Type",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: AppColors.color_text_primary,
                      ),
                    ),
                    value: _selectedSubscriptionType,
                    items: _subscriptionType.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSubscriptionType = newValue;
                      });
                    },
                  ),
                  TextFormField(
                    controller: txtC,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.color_text_primary,
                    ),
                    decoration:
                        InputDecoration(labelText: "Enter Pan Card Number"),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Pan Card Number.';
                      }
                      return null;
                    },
                    onSaved: (input) => address = input,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.color_primary,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Update",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: AppColors.color_white,
                      ),
                    ),
                  ),
                ),
              ),
              // onTap: () {
              //   submit(context);
              // },
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Select(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
