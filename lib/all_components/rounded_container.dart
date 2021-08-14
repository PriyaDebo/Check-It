import 'package:check_it/constants.dart';
import 'package:flutter/material.dart';

abstract class RoundContainer extends StatelessWidget {

  const RoundContainer({
    Key? key,
  }) : super(key: key);

  Widget getChild(size);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var child = getChild(size);

    return Container(
      child: child,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.001),
        padding: EdgeInsets.symmetric(horizontal: size.width*0.06, vertical: size.height*0.0001),
        width: size.width * 0.6,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height*6),
        ),
    );
  }
}