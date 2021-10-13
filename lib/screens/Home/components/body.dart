import 'package:check_it/all_components/navigation_drawer.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/screens/Home/components/background.dart';
import 'package:check_it/screens/Newlist/new_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  final String? result;
  final String username;
  Body(this.result, this.username);


  @override
  _BodyState createState() => _BodyState(result, username);
}

class _BodyState extends State<Body> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("");
  final String? id;
  final String username;
  _BodyState(this.id, this.username);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        backgroundColor: kWhite,
        drawer: NavigationDrawerWidget(username),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.clear_outlined);
                    this.cusSearchBar = TextField(
                      decoration: InputDecoration(
                        hintText: "Search your lists",
                      ),
                      textInputAction: TextInputAction.go,
                      style: GoogleFonts.lora(textStyle: TextStyle(color: kDarkBlue)),
                    );
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearchBar = Text("");
                  }
                });
              },
              icon: cusIcon,
            ),
          ],
          title: cusSearchBar,
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewList(id, username),
                ));
          },
          splashColor: kWhite,
          child: const Icon(Icons.add),
          backgroundColor: kYellow,
          foregroundColor: kDarkBlue,
        ),
      ),
    );
  }
}
