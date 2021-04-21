import 'package:Mumbai_Dabbawala/models/user.dart';
import 'package:Mumbai_Dabbawala/screens/screen_splash.dart';
import 'package:Mumbai_Dabbawala/screens/wrapper.dart';

import 'package:Mumbai_Dabbawala/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'values/app_colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Mumbai Dabbawala',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.color_primary,
          accentColor: AppColors.color_assent,
          fontFamily: 'Poppins',
        ),
        home: ScreenSplash(),
      ),
    );
  }
}
