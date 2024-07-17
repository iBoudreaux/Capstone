import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/letterexamplepage.dart';
class Letterlessons extends StatelessWidget {
  const Letterlessons({super.key});

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
              "Take a look at this chart. Every letter has its own hand sign.",
              style: GoogleFonts.montserrat(fontSize: 17),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),

          Positioned(
            top: 150,
            left: 50,
            child: Container(
              width: 300,
              height: 300,
              color: const Color.fromARGB(255, 104, 135, 45),
              child: Image.asset('lib/Images/ABClist.png')
            ),
          ),

          Positioned(
          top: 460,
          left: 16,
          right: 16,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            child: Text(
              "It's important to memorize all of these signs. Go ahead and practice performing these signs. It doesn't matter which hand you use as long as you're consistent.",
              style: GoogleFonts.montserrat(fontSize: 17),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Positioned(
          top: 610,
          left: 150,
          child: 
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => const ExamplePage(),
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

