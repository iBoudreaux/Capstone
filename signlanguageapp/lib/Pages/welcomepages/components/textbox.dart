import 'package:flutter/material.dart';

class MyTextBox extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String boxName;

  const MyTextBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.boxName,
  });

  @override
  _MyTextBoxState createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
