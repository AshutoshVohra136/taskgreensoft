import 'package:flutter/material.dart';

class Txtfield extends StatelessWidget {
  const Txtfield(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText});
  final controller;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey,
          filled: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
