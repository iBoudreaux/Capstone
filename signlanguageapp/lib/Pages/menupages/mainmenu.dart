import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/components/menulessoncard.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:signlanguageapp/Pages/menupages/components/bottomnavbar.dart';

class MainMenu extends StatelessWidget{
  const MainMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
        Text("Daily Goal progress", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
            
            //progress bar
            LinearPercentIndicator(
              width: 350,
              lineHeight: 20,
              percent: 0.7,
              animation: true,
              animationDuration: 1000,
              progressColor: const Color.fromARGB(255, 69, 157, 106),
              center: Text("70%", style: GoogleFonts.montserrat(),),
            ),

            const SizedBox(height: 40),

            Text("Basics", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),

            //lesson cards
            SizedBox(
            height: 200,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/abclessoncard.png",),
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/numberslessoncard.png",),
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/colorlessoncard.png"),
                SizedBox(width: 12)
              ],
            )
          ),

          const SizedBox(height: 30),

          Text("Questions", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),

          SizedBox(
            height: 200,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/abclessoncard.png",),
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/numberslessoncard.png",),
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/colorlessoncard.png"),
                SizedBox(width: 12)
              ],
            )
          ),

          const SizedBox(height: 30),

          Text("Sentence Forming", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),

          SizedBox(
            height: 200,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/abclessoncard.png",),
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/numberslessoncard.png",),
                SizedBox(width: 12),
                LessonCard(imagePath: "lib/Images/colorlessoncard.png"),
                SizedBox(width: 12)
              ],
            )
          ),

        const Padding(
          padding: EdgeInsets.only(top:30),
          child: 
            BottomNavBar()
          )
          
        ]
      ) 
    );
  }
}