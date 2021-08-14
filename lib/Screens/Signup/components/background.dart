import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 0,
          //   child: SvgPicture.asset(
          //     "assets/icons/up_wave.svg",
          //     height: size.height * 0.3,
          //     width: size.width,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   child: SvgPicture.asset(
          //     "assets/icons/down_wave.svg",
          //     height: size.height * 0.3,
          //     width: size.width,
          //   ),
          // ),
          // child,
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                     begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff539092),
                      Color(0xff8bcfcc),
                      Color(0xffaee8e6),
                      Color(0xfffdffe7),
                      Color(0xffaee8e6),
                      Color(0xff8bcfcc),
                      Color(0xff539092),

                    ])),
          ),
          child
        ],
      ),
    );
  }
}
