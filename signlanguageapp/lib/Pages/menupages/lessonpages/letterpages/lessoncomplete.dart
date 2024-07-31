import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletePage extends StatelessWidget{
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Stack(
        children: [
          Text("Lesson Complete!", style: GoogleFonts.montserrat(),)
        ],
      ),
    );
  }
  
}