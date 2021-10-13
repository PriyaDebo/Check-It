import 'package:check_it/Screens/Login/components/background.dart';
import 'package:check_it/Screens/Signup/signup_screen.dart';
import 'package:check_it/all_components/rounded_button.dart';
import 'package:check_it/all_components/rounded_input_field.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/operations/user_bl.dart';
import 'package:check_it/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {

  final UserBl userBl;
  Body(this.userBl);

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Background(
    child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Text(
          "LOGIN",
          style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.04, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.02),
        RoundInputField(
          hintText: "Username",
          onChanged: (value) {},
          icon: Icons.person,
          controller: usernameController,
          isObscure: false,
        ),
        SizedBox(height: size.height * 0.009),
        RoundInputField(
          hintText: "Password",
          onChanged: (value) {},
          icon: Icons.lock,
          isObscure: true,
          controller: passwordController,
        ),
        SizedBox(height: size.height * 0.009),
        RoundButton(
          text: "LOGIN",
          press: () async {
            FocusScope.of(context).unfocus();
            final username = usernameController.text.trim();
            final password = passwordController.text.trim();
            if (checkValidity(username, password, context)) {
              final result = await userBl.validLogin(username, password);
              if (result != "FAIL") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(result, username),));
              }
            }
            else {
              final snackBar = SnackBar(content: Text("Invalid Credentials"),behavior: SnackBarBehavior.floating,);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          color: kDarkBlue,
          textColor: kWhite,
        ),
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an account? ",
              style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.025),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(userBl),
                    ));
              },
              child: Text(
                "SIGN UP",
                style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue, fontWeight: FontWeight.bold), fontSize: size.height * 0.025),
              ),
            ),
          ],
        ),
            SizedBox(height: size.height * 0.1),
      ],
    )));
  }

  bool checkValidity(String username, String password, context) {
    if (username.isEmpty) {
      final snackBar = SnackBar(
        content: Text("Username Required"),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    else if (password.isEmpty) {
      final snackBar = SnackBar(
        content: Text("Password required"),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }
}
