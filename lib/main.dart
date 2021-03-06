import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/repository/api_repository.dart';

import 'login/view/login_screen.dart';

void main() {
  ApiRepository apiRepository = ApiRepository(baseUrl: "https://reqres.in/api");
  apiRepository.login();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xFF534C5F),
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.roboto(color: Colors.white),
          headline5: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
