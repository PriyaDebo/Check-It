import 'package:check_it/all_components/rounded_container.dart';
import 'package:check_it/constants.dart';
import 'package:flutter/material.dart';

class RoundInputField extends RoundContainer {
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const RoundInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.isObscure,
    this.controller,
  }) : super(key: key);

  @override
  Widget getChild(size) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscure,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: size.height * 0.02),
        prefixIcon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        hintText: hintText,
        filled: true,
        fillColor: kPrimaryLightColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(size.width * 0.05)),
      ),
      cursorColor: kPrimaryColor,
    );
  }
}
