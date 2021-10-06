import 'package:check_it/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawerWidget extends StatelessWidget {
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
              child: Text('Check It!', style: GoogleFonts.sofia(textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.05, fontWeight: FontWeight.bold)),
              decoration: new BoxDecoration(color: kYellow),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.fromLTRB(size.width * 0.04, size.height * 0.028, 0, 0),
            ),
          ),
          SizedBox(height: size.height * 0.009),
          buildMenuItem(
            size,
            text: 'Lists',
            icon: Icons.list_alt ,
          ),
          SizedBox(height: size.height * 0.0009),
          buildMenuItem(
            size,
            text: 'Reminders',
            icon: Icons.notifications_active_outlined,
          ),
          Divider(
            color: kDarkBlue,
            indent: size.width * 0.03,
            endIndent: size.width * 0.03,
          ),
          buildMenuItem(
            size,
            text: 'Logout',
            icon: Icons.logout,
          )
        ],
      ),
    ));
  }

  Widget buildMenuItem(
    Size size, {
    required String text,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      leading: Icon(icon, color: kDarkBlue),
      title: Text(
        text,
        style: GoogleFonts.lora (textStyle: TextStyle(color: kDarkBlue), fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );
  }
}
