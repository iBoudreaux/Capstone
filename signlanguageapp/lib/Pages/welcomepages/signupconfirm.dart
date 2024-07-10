import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';

class Signupconfirm extends StatelessWidget {
  const Signupconfirm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 90),
            const Icon(
                Icons.check_circle_rounded,
                size: 100
              ),
              Text(
                "All set!",
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                ),
            
            ElevatedButton(onPressed: () {
              Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => UserProfile(),
                        ),
                      );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ), child: const Icon(Icons.arrow_forward_outlined),
            )
          ],
        ),
      ),
    
    );
  }
}