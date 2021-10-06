import 'package:check_it/all_components/navigation_drawer.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/screens/Home/components/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: Scaffold(
        backgroundColor: kWhite,
        drawer: NavigationDrawerWidget(),
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
    ),);
  }
}
//
// class ListSearch extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [IconButton(onPressed: () {}, icon: Icon(Icons.clear_outlined))];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {},
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return TextField();
//   }
// }
