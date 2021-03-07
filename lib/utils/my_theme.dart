import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static get getTheme => ThemeData(
        backgroundColor: Color(0xFF534C5F),
        primarySwatch: Colors.blue,
        buttonColor: Color(0xFF1DE278),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.roboto(color: Colors.white),
          headline5: GoogleFonts.roboto(color: Colors.white),
          headline4: GoogleFonts.roboto(color: Colors.white),
        ),
      );
}
