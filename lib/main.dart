import 'package:calculater/modules/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'modules/x_o/o_o_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        XoScreen.routeName: (context) => XoScreen(),
      },
    );
  }
}
