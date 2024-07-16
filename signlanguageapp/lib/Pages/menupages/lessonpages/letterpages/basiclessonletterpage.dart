import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/menupages/components/introlessonpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LetterPage extends StatelessWidget{
  LetterPage({super.key});

  final PageController pgControlller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Stack (
        children: [

          PageView(
            controller: pgControlller,

            children: const [
              Padding(
                padding: EdgeInsets.only( top: 200 , left: 30, right: 30),
                child: IntroLessonPage(
                strMessage: "Welcome to Sign the Way! We're excited to go on this sign language journey with you!\n\n"
                "American Sign Language (ASL) is just like any other language with its own rules, structure, and specific ways of communication.",
                lastPage: false,)),
            
              Padding(
                padding: EdgeInsets.only( top: 250 , left: 40, right: 30),
                child: IntroLessonPage(
                strMessage: "Unlike other languages, however, ASL uses only hands, body language, and facial expressions to talk to others.\n"
                "But, how do we use our hands to talk?",
                lastPage: false,)),
              
              Padding(
                padding: EdgeInsets.only( top: 260 , left: 30, right: 30),
                child: IntroLessonPage(
                  strMessage: "Just like you learn to read/write letters in English, you start with the language's foundation, its letters or characters!",
                  lastPage: true,),
          ),
        ],
        
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(controller: pgControlller, count: 3),
          ),
      ]
    )
    );
  }
  
}