import 'package:flutter/material.dart';
import 'package:login_app/utils/utils.dart';
import 'package:login_app/login/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.getTheme,
      home: LoginScreen(),
    );
  }
}
