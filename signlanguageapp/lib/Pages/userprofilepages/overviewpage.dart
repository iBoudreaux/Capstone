import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Text("Daily Progress", style: GoogleFonts.montserrat(fontSize: 15),),
          const SizedBox(height: 20,),
          LinearPercentIndicator(
                width: 350,
                lineHeight: 20,
                percent: 0.1,
                animation: true,
                animationDuration: 1000,
                progressColor: const Color.fromARGB(255, 69, 157, 106),
                center: Text("10%", style: GoogleFonts.montserrat(),),
              ),

          const SizedBox(height: 50,),
          Text("Course Progress", style: GoogleFonts.montserrat(fontSize: 15),),
          const SizedBox(height: 20,),
          LinearPercentIndicator(
                width: 350,
                lineHeight: 20,
                percent: 0.4,
                animation: true,
                animationDuration: 1000,
                progressColor: const Color.fromARGB(255, 69, 157, 106),
                center: Text("40%", style: GoogleFonts.montserrat(),),
              ),

          const SizedBox(height: 100,),
          ElevatedButton(
            onPressed: () 
            {          
              Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => UserProfile(),
                        ),
                      );
            },
            child: const Icon(Icons.arrow_back_rounded))
        ],
      ),
    );
    
    }
}
