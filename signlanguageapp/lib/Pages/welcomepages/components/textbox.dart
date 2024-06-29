import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextBox ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child:
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple.shade400),
              borderRadius: BorderRadius.circular(15),
              
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            fillColor: Colors.white38,
            filled: true,
            hintText: hintText,
          ),
        ),
    );
  }
}
