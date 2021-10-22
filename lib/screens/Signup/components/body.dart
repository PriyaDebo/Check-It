import 'package:check_it/Screens/Login/login_screen.dart';
import 'package:check_it/Screens/Signup//components/background.dart';
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
        // child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "SIGN UP",
          style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height*0.04, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.02),
        RoundInputField(
          hintText: "Username",
          onChanged: (value) {},
          icon: Icons.person,
          isObscure: false,
          controller: usernameController,
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
          text: "SIGN UP",
          press: () async {
            FocusScope.of(context).unfocus();
            final username = usernameController.text.trim();
            final password = passwordController.text.trim();
            if (checkValidity(username, password, context)) {
              final result = await userBl.validSignup(username, password);
              if (result != "FAIL") {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(result, username),));
              }
              else {
                final snackBar = SnackBar(
                    content: Text("Username Exists. Try Again!", style: GoogleFonts.lora(),),
                    behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
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
              "Already have an account? ",
              style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height*0.025),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(new UserBl()),
                    ));
              },
              child: Text(
                "LOGIN",
                style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkBlue, fontWeight: FontWeight.bold), fontSize: size.height*0.025),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.1),
      ],
    ));
    // );
  }

  bool checkValidity(String username, String password, BuildContext context) {
    if (username.isEmpty) {
      final snackBar = SnackBar(
        content: Text("Username Required", style: GoogleFonts.lora(),),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    else if (password.isEmpty) {
      final snackBar = SnackBar(
        content: Text("Password required", style: GoogleFonts.lora(),),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }
}
