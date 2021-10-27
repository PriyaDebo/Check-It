import 'package:check_it/all_components/checklist_item.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/models/checklists_model.dart';
import 'package:check_it/operations/list_bl.dart';
import 'package:check_it/operations/user_bl.dart';
import 'package:check_it/screens/Home/home_screen.dart';
import 'package:check_it/screens/Login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class Body extends StatefulWidget {
  final String? userId;
  final String username;
  final CheckListModel? checklist;
  final uuid = Uuid();
  final TextEditingController listName = new TextEditingController();
  Map<String, ChecklistItem> items = new Map<String, ChecklistItem>();

  Body(this.checklist, this.userId, this.username);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addExisting();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        backgroundColor: kYellow,
        child: Icon(Icons.add, color: kDarkBlue,),
      ),
      appBar: AppBar(
        backgroundColor: kYellow,
        foregroundColor: kDarkBlue,
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                if (widget.checklist == null) {
                  var resCode = await ListBl().createList(widget.listName.text.trim(), widget.items);
                  if (resCode == 200) {
                    final snackBar = SnackBar(
                      content: Text("Checklist Saved!", style: GoogleFonts.lora(),),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(widget.userId, widget.username)));
                  } else if(resCode == 401) {
                    final snackBar = SnackBar(
                      content: Text("OH NO! You were logged out!", style: GoogleFonts.lora(),),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(UserBl())));
                  }

                  else {
                    final snackBar = SnackBar(
                      content: Text("Unable to save! Try to save again!", style: GoogleFonts.lora(),),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  final res = await ListBl().updateList(widget.checklist!.id.toString(), widget.userId.toString(), widget.listName.text.trim(), widget.items);
                  if (res == 200) {
                    final snackBar = SnackBar(
                      content: Text("Checklist Saved!", style: GoogleFonts.lora(color: kWhite),),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(widget.userId, widget.username)));
                  } else if (res == 401) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OH NO! You were logged out!", style: GoogleFonts.lora(),)));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(UserBl())));
                  } else {
                    final snackBar = SnackBar(
                      content: Text("Unable to save! Try to save again!", style: GoogleFonts.lora(),),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: Text(
                "Save",
                style: GoogleFonts.lora(
                    textStyle: TextStyle(
                  color: kDarkBlue,
                  fontSize: size.height * 0.025,
                )),
              )),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: kYellow,
                      content: Text("Are you sure you want to delete this checklist permanently?", style: GoogleFonts.lora(color: kDarkBlue, fontWeight: FontWeight.bold),),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () async {
                              if (widget.checklist == null) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(widget.userId, widget.username)));
                              } else {
                                final res = await ListBl().deleteList(widget.checklist!.id.toString());
                                if (res == 200) {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(widget.userId, widget.username)));
                                } else if (res == 401) {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(UserBl())));
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text("Unable to delete! Try to delete again!", style: GoogleFonts.lora(),),
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              }
                            },
                            child: Text("YES", style: GoogleFonts.lora(textStyle: TextStyle(color: kDarkBlue, fontWeight: FontWeight.bold)))),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("NO", style: GoogleFonts.lora(textStyle: TextStyle(color: kDarkBlue, fontWeight: FontWeight.bold))))
                      ],
                    );
                  });
            },
            icon: Icon(Icons.delete_outline),
            color: kDarkBlue,
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: size.height * 0.04,
              padding: EdgeInsets.symmetric(vertical: size.height * 0.001, horizontal: size.width * 0.03),
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(size.width * 0.02, 0, size.width * 0.02, 0),
                      hintText: "Title",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                  style: GoogleFonts.lora(textStyle: TextStyle(color: kDarkBlue, fontWeight: FontWeight.bold, fontSize: size.height * 0.03)),
                  textInputAction: TextInputAction.go,
                  controller: widget.listName,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            Flexible(
              fit: FlexFit.tight,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      var keys = widget.items.keys.toList();
                      var val = widget.items[keys[index]];
                      return Container(
                        // child: items.values.elementAt(index),
                          child: val);
                    }),
            ),
          ],
        ),
    );
  }

  addExisting() {
    if (widget.checklist != null) {
      setState(() {
        widget.listName.text = widget.checklist!.name;
        widget.checklist!.items.forEach((element) {
          var newUuid = widget.uuid.v4();
          var existingItems = ChecklistItem(UniqueKey(), newUuid, removeItem);
          existingItems.isChecked = element.isChecked;
          existingItems.item.text = element.itemName;
          widget.items[newUuid] = existingItems;
        });
      });
    }
  }

  addItem() {
    setState(() {
      var newUuid = widget.uuid.v4();
      var newListItem = ChecklistItem(UniqueKey(), newUuid, removeItem);
      widget.items[newUuid] = newListItem;
      newListItem.focusNode.requestFocus();
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200));
    });
  }

  removeItem(String newUuid) {
    setState(() {
      widget.items.remove(newUuid);
      widget.items = Map.from(widget.items);
    });
  }
}
