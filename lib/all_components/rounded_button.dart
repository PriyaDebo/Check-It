import 'package:check_it/all_components/rounded_container.dart';
import 'package:check_it/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends RoundContainer {
  final String text;
  final void Function() press;
  final Color color, textColor;

  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = kPrimaryLightColor,
  }) : super(key: key);

  @override
  Widget getChild(size) {
    var textStyle = GoogleFonts.comicNeue(
      textStyle: TextStyle(fontSize: size.height*0.02, fontWeight: FontWeight.bold),
    );
    var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.height*0.02));
    var style = TextButton.styleFrom(
        textStyle: textStyle, primary: textColor, backgroundColor: color, shape: shape);
    return SizedBox(width: size.width*2, height: size.height*1, child: TextButton(style: style, onPressed: press, child: Text(text)));
  }
}
