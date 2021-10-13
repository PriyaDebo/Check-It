import 'package:check_it/all_components/checklist_item.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/operations/list_bl.dart';
import 'package:check_it/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class Body extends StatefulWidget {
  final String? id;
  final String username;
  Body(this.id, this.username);

  @override
  _BodyState createState() => _BodyState(id, username);
}

class _BodyState extends State<Body> {
  TextEditingController listName = new TextEditingController();
  Map<String, ChecklistItem> items = new Map<String, ChecklistItem>();
  var uuid = Uuid();
  final String? id;
  final String username;
  _BodyState(this.id, this.username);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kYellow,
        foregroundColor: kDarkBlue,
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                print(await ListBl().createList(id.toString(), listName.text.trim(), items));
                if(await ListBl().createList(id.toString(), listName.text.trim(), items)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(id, username)
                      ));
                }
                else {
                  final snackBar = SnackBar(
                    content: Text("Unable to save! Try to save again!"),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            onPressed: () {},
            icon: Icon(Icons.delete_outline),
            color: kDarkBlue,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.001, horizontal: size.width * 0.03),
            child: SizedBox(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(size.width * 0.02, 0, size.width * 0.02, 0),
                    hintText: "Title",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
                textInputAction: TextInputAction.go,
                controller: listName,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var keys = items.keys.toList();
                  var val = items[keys[index]];
                  return Container(
                    // child: items.values.elementAt(index),
                    child: val
                  );
                }),
          ),
          IconButton(
            onPressed: () {
              addItem();
            },
            icon: Icon(Icons.add),
            color: kDarkBlue,
          ),
        ],
      ),
    );
  }

  addItem() {
    setState(() {
      var newUuid = uuid.v4();
      items[newUuid] = ChecklistItem(UniqueKey(), newUuid, removeItem);
    });
  }

  removeItem(String newUuid) {
    setState(() {
      items.remove(newUuid);
      items = Map.from(items);
    });
  }
}
