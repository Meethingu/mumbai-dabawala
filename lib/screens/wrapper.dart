import 'package:Mumbai_Dabbawala/models/user.dart';
import 'package:Mumbai_Dabbawala/pages/page_home.dart';
import 'package:Mumbai_Dabbawala/screens/authenticate.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    print(user);
    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return PageHome();
    }
  }
}
