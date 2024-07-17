import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/letterexplainpage.dart';

class IntroLessonPage extends StatelessWidget {
  final String strMessage;
  final bool lastPage;


  const IntroLessonPage({super.key, required this.strMessage, required this.lastPage});



  @override
  Widget build(BuildContext context) {
    return  
      lastPage? 
      Stack(
        children: [
          Container(
          color: const Color.fromARGB(255, 127, 172, 42),
          child: Text(
                  strMessage, 
                  style: GoogleFonts.montserrat(fontSize: 16),
              ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 150, left: 140),
        child: ElevatedButton(onPressed: () {
          Navigator.push(
                              context, 
                              MaterialPageRoute(
                              builder: (context) => const Letterlessons(),
                                ),
                              );
        } , child: const Icon(Icons.arrow_forward_rounded)),
      )
        ],
      ):

      Container(
        color: const Color.fromARGB(255, 127, 172, 42),
        child: Text(
                strMessage, 
                style: GoogleFonts.montserrat(fontSize: 16),
            ),
      );
      
  }
  
}
