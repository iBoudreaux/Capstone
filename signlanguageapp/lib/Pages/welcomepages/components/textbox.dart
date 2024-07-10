import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final String boxName;
 
  

  const MyTextBox ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.boxName,


  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child:
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
    );
  }
}
