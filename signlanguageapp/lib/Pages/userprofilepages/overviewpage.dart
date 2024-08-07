import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';
import 'package:signlanguageapp/globalvariables.dart' as globals;

class OverviewPage extends StatelessWidget {
  OverviewPage({super.key});

  final userSession = Hive.box('storagebox');
  final dailyProgress = globals.dailiesCompleted;

  @override
  Widget build(BuildContext context) {
    var dailyText = (dailyProgress * 10).toString();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                "Daily Progress",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.9,
                lineHeight: 20,
                percent: dailyProgress,
                animation: true,
                animationDuration: 1000,
                progressColor: const Color.fromARGB(255, 69, 157, 106),
                backgroundColor: Colors.white,
                center: Text(
                  "$dailyText%",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Text(
                "Course Progress",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.9,
                lineHeight: 20,
                percent: 0.4,
                animation: true,
                animationDuration: 1000,
                progressColor: const Color.fromARGB(255, 69, 157, 106),
                backgroundColor: Colors.white,
                center: Text(
                  "40%",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, shape: CircleBorder(),
                  padding: EdgeInsets.all(20), // foreground
                ),
                child: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
