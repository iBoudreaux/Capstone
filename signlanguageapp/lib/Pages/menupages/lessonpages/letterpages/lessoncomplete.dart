import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/mainmenu.dart';

class Lessoncomplete extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const Lessoncomplete({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    double percentage = (score / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lesson Completed!',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score:',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$score / $totalQuestions',
              style: GoogleFonts.montserrat(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 300,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LinearProgressIndicator(
                  value: score / totalQuestions,
                  backgroundColor: Colors.transparent,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 69, 121, 185)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainMenu(),
          ),
        );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 127, 172, 42), backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Back to Home', style: GoogleFonts.montserrat()),
            ),
          ],
        ),
      ),
    );
  }
}