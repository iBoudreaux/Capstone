import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/components/menulessoncard.dart';
import 'package:signlanguageapp/Pages/menupages/components/bottomnavbar.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/basiclessonletterpage.dart';
import 'package:signlanguageapp/Pages/menupages/components/progressbar.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/letterpractice2.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 5),
            child: Text("Daily Progress", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold))
            ),

          // Progress bar
          const Padding(padding: EdgeInsets.only(left: 10),
          child: 
          Progressbar(percentNum: 0.7, percentStr: "70%")
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                LessonCard(
                  lessonTitle: "Letters",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LetterPage(),
                      ),
                      
                    );
                  },
                  icon: Icons.abc_rounded, 
                  percentStr: '33%',
                  percentNum: 0.33,
                  width: 300
                ),

                const SizedBox(height: 10),
                LessonCard(
                  lessonTitle: "Letters Part 2",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LetterPractice(),
                      ),
                      
                    );
                  },
                  icon: Icons.abc_rounded,
                  percentStr: '%82',
                  percentNum: 0.82,
                  width: 300

                ),

              //Spacing
                const SizedBox(height: 10),
                LessonCard(
                  lessonTitle: "Numbers",
                  press: () {
                    // Define navigation or action here
                  },
                  icon: Icons.onetwothree_rounded,
                  percentStr: '%82',
                  percentNum: 0.82,
                  width: 300

                ),
              

                //Spacing
                const SizedBox(height: 10),
                LessonCard(
                  lessonTitle: "Gestures",
                  press: () {
                    // Define navigation or action here
                  },
                  icon: Icons.waving_hand_rounded,
                  percentStr: '57%',
                  percentNum: 0.57,
                  width: 300

                ),
              ],
            ),
          ),
          // Navbar
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}



