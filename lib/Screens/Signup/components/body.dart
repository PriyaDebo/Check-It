import 'package:check_it/Screens/Login/login_screen.dart';
import 'package:check_it/Screens/Signup//components/background.dart';
import 'package:check_it/all_components/rounded_button.dart';
import 'package:check_it/all_components/rounded_input_field.dart';
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
          "SIGN UP",
          style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kPrimaryColor), fontSize: size.height*0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.003),
        Image.asset("assets/images/ic_launcher.png", height: size.height * 0.12),
        SizedBox(height: size.height * 0.02),
        RoundInputField(
          hintText: "Username",
          onChanged: (value) {},
          icon: Icons.person,
          isObscure: false,
        ),
        SizedBox(height: size.height * 0.009),
        RoundInputField(
          hintText: "Password",
          onChanged: (value) {},
          icon: Icons.lock,
          isObscure: true,
        ),
        SizedBox(height: size.height * 0.009),
        RoundButton(
          text: "SIGN UP",
          press: () {},
          color: kPrimaryColor,
          textColor: kPrimaryLightColor,
        ),
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Already have an account? ",
              style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kPrimaryColor), fontSize: size.height*0.025),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text(
                "LOGIN",
                style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold), fontSize: size.height*0.025),
              ),
            ),
          ],
        )
      ],
    )));
  }
}
