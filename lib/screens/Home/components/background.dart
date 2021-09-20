import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height,
      width: double.infinity,
      child:
      SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                child: this.child,
                alignment: Alignment.center,
              ))),
    );
  }
}
