import 'package:check_it/constants.dart';
import 'package:check_it/operations/secure_bl.dart';
import 'package:check_it/operations/user_bl.dart';
import 'package:check_it/screens/Login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawerWidget extends StatefulWidget {

  NavigationDrawerWidget();
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationDrawerWidget> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Material(
      color: kWhite,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.1,
            child: DrawerHeader(
              child: FutureBuilder<String?> (
                future: UserSecureStorage.getUsername(),
                builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                  String textData;
                  if (snapshot.hasData) {
                    textData = snapshot.data.toString();
                  } else {
                    textData = "Check It!";
                  }
                  return Text(textData, style: GoogleFonts.sofia(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.05, fontWeight: FontWeight.bold));
                }
              ),
              decoration: new BoxDecoration(color: kYellow),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.fromLTRB(size.width * 0.04, size.height * 0.02, 0, 0),
            ),
          ),
          SizedBox(height: size.height * 0.009),
          buildMenuItem(
            size,
            text: 'Lists',
            icon: Icons.list_alt ,
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(height: size.height * 0.0009),
          Divider(
            color: kDarkBlue,
            indent: size.width * 0.03,
            endIndent: size.width * 0.03,
          ),
          buildMenuItem(
            size,
            text: 'Logout',
            icon: Icons.logout,
            onTap: () {
              UserSecureStorage.deleteAll();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(UserBl())));
            },
          )
        ],
      ),
    ));
  }

  Widget buildMenuItem(
    Size size, {
    required String text,
    required IconData icon,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      leading: Icon(icon, color: kDarkBlue),
      title: Text(
        text,
        style: GoogleFonts.lora (textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
