import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/letterpracticepage.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Stack(
        children: [
          Positioned(
          top: 80,
          left: 16,
          right: 16,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            child: Text(
              "Using only letters to sign something is called finger spelling. It can be useful for when introducing yourself and signing your name.",
              style: GoogleFonts.montserrat(fontSize: 17),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),

          Positioned(
          top: 160,
          left: 70,
          child: SizedBox(
            height: 250,
            width: 250,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10),
              
              children: [
                exmaplePhotos('lib/Images/letterA.png'),
                exmaplePhotos('lib/Images/letterB.png'),
                exmaplePhotos('lib/Images/letterB.png'),
                exmaplePhotos('lib/Images/letterY.png'),

              ],
            ),
          ),
        ),

        Positioned(
          top: 460,
          left: 16,
          right: 16,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            child: Text(
              "For example, if your name was Abby, you would want to sign the letters 'A', 'B', 'B', and 'Y'.",
              style: GoogleFonts.montserrat(fontSize: 17),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Positioned(
          top: 550,
          left: 150,
          child: 
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => const LetterPractice(),
                        ),
                      );
            },
            child: Text(
              "Next", 
              style: GoogleFonts.montserrat(),
              )
            )
          ),

        ],
      )
    );
  }

}

Widget exmaplePhotos(String image) {
  return Container(
    child: Image.asset(image),
  );
}