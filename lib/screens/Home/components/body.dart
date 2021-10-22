import 'dart:convert';

import 'package:check_it/all_components/navigation_drawer.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/models/alllists_model.dart';
import 'package:check_it/models/checklists_model.dart';
import 'package:check_it/operations/list_bl.dart';
import 'package:check_it/operations/user_bl.dart';
import 'package:check_it/screens/Home/components/background.dart';
import 'package:check_it/screens/Login/login_screen.dart';
import 'package:check_it/screens/Newlist/new_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Body extends StatefulWidget {
  final String? userId;
  final String username;

  Body(this.userId, this.username);

  AllListsModel? allLists;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("");
  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Scaffold(
            backgroundColor: kWhite,
            drawer: NavigationDrawerWidget(widget.username),
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewList(null, widget.userId, widget.username),
                    ));
              },
              splashColor: kWhite,
              child: const Icon(Icons.add),
              backgroundColor: kYellow,
              foregroundColor: kDarkBlue,
            ),
            body: FutureBuilder<AllListsModel>(
                  future: getAllChecklists(context),
                  builder: (BuildContext context, AsyncSnapshot<AllListsModel> snapshot) {
                    Widget widgetChild;
                    if (snapshot.hasData) {
                      widget.allLists = snapshot.data;
                      widgetChild = ListView(children: createCards(size));
                    } else if (snapshot.hasError) {
                      widgetChild = SnackBar(
                        content: Text(snapshot.error.toString(), style: GoogleFonts.lora(),),
                        behavior: SnackBarBehavior.floating,
                      );
                      // ScaffoldMessenger.of(context).showSnackBar(widgetChild);
                    } else {
                      widgetChild = SizedBox(
                        child: CircularProgressIndicator(),
                        width: size.height * 0.5,
                        height: size.height * 0.5,
                      );
                    }
                    return widgetChild;
                  }),
            ));
  }

  List<Card> createCards(Size size) {
    var cards = <Card>[];
    widget.allLists?.lists.forEach((element) {
      cards.add(Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.height * 0.02)),
          shadowColor: kDarkBlue,
          elevation: size.height * 0.01,
          child: Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(size.height * 0.02)),
              child: InkWell(
                splashColor: kYellow,
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewList(element, widget.userId, widget.username)));
                },
                child: Padding(
                    padding: EdgeInsets.all(size.height * 0.03),
                    child: Column(children: <Widget>[
                      Text(
                        element.name,
                        style: GoogleFonts.lora(textStyle: TextStyle(color: kDarkBlue, fontWeight: FontWeight.w600, fontSize: size.height * 0.03)),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: size.width * 0.03,
                      ),
                      Stack(children: <Widget>[
                        LinearProgressIndicator(
                          value: progress(element),
                          color: kYellow,
                          backgroundColor: kDarkBlue,
                          minHeight: size.height * 0.03,
                        ),
                        Center(
                          child: Text(
                            (progress(element) * 100).round().toString() + " %",
                            style: GoogleFonts.lora(color: kWhite, fontWeight: FontWeight.w700, fontSize: size.height * 0.024),
                          ),
                        )
                      ]),
                    ])),
              ))));
    });
    return cards;
  }

  double progress(CheckListModel oneList) {
    double count = 0;
    if (oneList.items.length == 0) {
      return count;
    }
    oneList.items.forEach((element) {
      if (element.isChecked) {
        count = count + 1;
      }
    });
    return count / oneList.items.length;
  }

  Future<AllListsModel> getAllChecklists(context) async {
    final res = await ListBl().getAllList();
    if(res.statusCode == 401) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen(UserBl())));
    }
    final responseJson = jsonDecode(res.body);
    return AllListsModel.fromJson(responseJson);
  }
}
