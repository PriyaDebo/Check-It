import 'package:check_it/Screens/Login/components/background.dart';
import 'package:check_it/Screens/Signup/signup_screen.dart';
import 'package:check_it/all_components/rounded_button.dart';
import 'package:check_it/all_components/rounded_input_field.dart';
import 'package:check_it/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Background(
    child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Text(
          "LOGIN",
          style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kPrimaryColor), fontSize: size.height * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.003),
        Image.asset("assets/images/ic_launcher.png", height: size.height * 0.12),
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
          press: () {
            FocusScope.of(context).unfocus();
            final username = usernameController.text.trim();
            final password = passwordController.text.trim();
            if (username.isEmpty) {
              final snackBar = SnackBar(
                content: Text("Username Required"),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else if (password.isEmpty) {
              final snackBar = SnackBar(
                content: Text("Password required"),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          color: kPrimaryColor,
          textColor: kPrimaryLightColor,
        ),
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an account? ",
              style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kPrimaryColor), fontSize: size.height * 0.025),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
              },
              child: Text(
                "SIGN UP",
                style: GoogleFonts.comicNeue(textStyle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold), fontSize: size.height * 0.025),
              ),
            ),
          ],
        )
      ],
    )));
  }
}
