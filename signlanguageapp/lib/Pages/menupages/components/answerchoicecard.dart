import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerChoiceCard extends StatelessWidget{
  final answerchoice;
  
  const AnswerChoiceCard({super.key, required this.answerchoice});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 104, 135, 45),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        answerchoice,
        style: GoogleFonts.montserrat(fontSize: 13, color: Colors.white),
      ),
    );
  }
  
}