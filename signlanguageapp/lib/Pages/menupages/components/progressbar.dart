import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Progressbar extends StatelessWidget{
  final String percentStr;
  final double percentNum;
  final double? width;
  const Progressbar({super.key, required this.percentNum,required this.percentStr, this.width});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
        width: width,
        lineHeight: 20,
        percent: percentNum,
        animation: true,
        animationDuration: 1000,
        progressColor: const Color.fromARGB(255, 69, 157, 106),
        center: Text(
          percentStr,
          style: GoogleFonts.montserrat(),
          ),
    );
  }
  
}