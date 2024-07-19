import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/questions/questions.dart';

class LetterPractice extends StatefulWidget {
  const LetterPractice({super.key});

  @override
  State<LetterPractice> createState() => _InputExampleState();
}

class _InputExampleState extends State<LetterPractice> {
  String? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int progress = 0;

  void pickAnswer(String value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
      print(score);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex]; //grabbing first question obj
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 100, left: 30),
            child: 
            Text(
              "Try it yourself.\n${question.question}",  //grabbing question in question obj
              style: GoogleFonts.montserrat(fontSize: 15), 
            )
          ),

          Padding(padding: const EdgeInsets.only(top: 250, left: 70),
          child:
            SizedBox(
              width: 250,
              height: 250,
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: question.options.map((option) {
                  return GestureDetector(
                    onTap: () {
                      pickAnswer(option);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 50, 147, 125),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                      }).toList(),
                    ),
            ),
          )
        ]
      ),
    );
  }
}