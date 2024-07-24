import 'package:flutter/material.dart';

class Questionletter extends StatelessWidget{
  final String imagePath;
  const Questionletter({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(imagePath)
    );
  }
  
}