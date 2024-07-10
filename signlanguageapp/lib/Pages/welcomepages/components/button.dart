import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final String buttonName;

  const MyButton ({super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 100),
        decoration:  BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(255, 59, 25, 22),
              blurRadius: 0.0,
              offset: Offset(3.0, 0),
              blurStyle: BlurStyle.inner,
              spreadRadius: 5.0
            ),
            BoxShadow(
              color: Color.fromARGB(255, 78, 30, 26),
              blurRadius: 0.0,
              offset: Offset(-3.0, 0),
              blurStyle: BlurStyle.inner,
              spreadRadius: 5.0
            )
          ],

          color: const Color.fromARGB(255, 244, 248, 236),
          borderRadius: BorderRadius.circular(30),
          
        ),
        child: Center(
          child: Text(
          buttonName,
          style: GoogleFonts.montserrat(
            color: const Color.fromARGB(255, 59, 25, 22),
            fontWeight: FontWeight.bold,
            fontSize: 13
          ),
          ),
        ),
      ),
    );
  }
}