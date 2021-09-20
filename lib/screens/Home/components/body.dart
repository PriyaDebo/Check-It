import 'package:check_it/screens/Home/components/background.dart';
import 'package:check_it/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text(
      "Coming Soon",
      style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.06, fontWeight: FontWeight.bold),
    ),
  ]
      )
      )
    );
  }
}