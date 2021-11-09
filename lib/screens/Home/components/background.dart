import 'package:check_it/constants.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
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
      child: SafeArea(
          child: Scaffold(
              backgroundColor: kWhite,
              body: DoubleBackToCloseApp(
                  snackBar: SnackBar(
                    content: Text("Press again to exit"),
                    behavior: SnackBarBehavior.floating,
                  ),
                  child: Container(
                    child: this.child,
                    alignment: Alignment.center,
                  )))),
    );
  }
}
