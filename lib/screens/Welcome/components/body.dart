import 'package:check_it/Screens/Login/login_screen.dart';
import 'package:check_it/Screens/Signup/signup_screen.dart';
import 'package:check_it/Screens/Welcome/components/background.dart';
import 'package:check_it/all_components/rounded_button.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/operations/user_bl.dart';
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
          "Welcome to Check It!",
          style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height*0.05, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.004),
        Image.asset("assets/images/ic_launcher.png", height: size.height * 0.12),
        SizedBox(height: size.height * 0.04),
        RoundButton(
          text: "LOGIN",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                   LoginScreen(UserBl()),
              ),
            );
          },
          color: kDarkBlue,
          textColor: kWhite,
        ),
        SizedBox(height: size.height * 0.04),
        RoundButton(
          text: "SIGN UP",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen(UserBl()),
              )
            );
          },
          color: kWhite,
          textColor: kDarkBlue,
        )
      ],
    )));
  }
}
