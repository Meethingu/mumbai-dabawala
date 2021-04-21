import 'package:Mumbai_Dabbawala/screens/screen_auth.dart';
import 'package:Mumbai_Dabbawala/services/auth.dart';
import 'package:Mumbai_Dabbawala/values/app_colors.dart';
import 'package:Mumbai_Dabbawala/widgets/AppText.dart';
import 'package:flutter/material.dart';

import 'screen_init.dart';

class Login extends StatefulWidget {
  final Function toogleView;
  Login({this.toogleView, void Function() toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  final _formaKeyb = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();

  BuildContext mContext;

  String phone, otp;
  String error;
  String email = '';
  String password = '';
  static String verificationId;

  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 220.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/design.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
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
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 22.0,
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: AppColors.color_primary,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sfpro',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Please Login to Your Account",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'sfpro',
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: TextFormField(
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: TextFormField(
                                    validator: (val) => val.length < 6
                                        ? 'Enter a password 6+ charater long'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'sfpro',
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ScreenInit(),
                                    ),
                                  ),
                                  // onTap: () async {
                                  //   dynamic result =
                                  //       await _auth.signInAnon();
                                  //   if (result == null) {
                                  //     print('error signing in');
                                  //   } else {
                                  //     print('signed in');
                                  //     print(result.uid);
                                  //   }
                                  // },
                                  // onTap: () async {
                                  //   print(email);
                                  //   print(password);
                                  // },
                                  // onTap: () async {
                                  //   if (_formaKeyb.currentState.validate()) {
                                  //     dynamic result = await _auth
                                  //         .signInWithEmailAndPassword(
                                  //             email, password);
                                  //     if (result == null) {
                                  //       setState(() => error =
                                  //           'Could not sign in with these credentials');
                                  //     }
                                  //   }
                                  // },

                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: AppColors.color_primary,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'sfpro'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'sfpro'),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ScreenAuth(),
                                        ),
                                      ),
                                      child: Text(
                                        " SIGN UP",
                                        style: TextStyle(
                                            color: AppColors.color_primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
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
              SizedBox(
                height: 100,
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
            ],
          ),
        ],
      ),
    );
  }
}
