import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/button.dart';
import 'package:signlanguageapp/Pages/welcomepages/loginpage.dart';
import 'package:signlanguageapp/Pages/welcomepages/signuppage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _HomePageState();
}

class _HomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
              color: const Color.fromARGB(255, 127, 172, 42),
              height: 800,
              width: 500,
              child: Column(
                children: [
                  
                  const SizedBox(height: 300),
                  Text("Welcome",
                  style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24
                  )
                ),

                const SizedBox(height: 10),
                //Log in Button
                MyButton(
                  buttonName: "LOG IN", 
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  ),

                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(color: Colors.white),
                      children: <TextSpan>[
                        const TextSpan(text: "Don't have an account?"),
                        TextSpan(
                          text: "  Sign up!",
                          style: GoogleFonts.montserrat(color:const Color.fromARGB(255, 11, 95, 220)),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                              builder: (context) => SignupPage(),
                                ),
                              );
                          }
                        )
                      ]
                    )
                  )


                  
            //Sign Up
                ],
              )
            ), 
      ),
    );
  }
}

 // const Positioned(
                  //   right: -300,
                  //   top: 200,
                  //   height: 900,
                  //   width: 800,
                  //   child: DecoratedBox(
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       shape: BoxShape.circle
                  //     ),
                  //   )
