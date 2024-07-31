import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/lessoncomplete.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/questions/questions.dart';
import 'package:signlanguageapp/Pages/menupages/components/questionletter.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/lessoncomplete.dart';
import 'package:signlanguageapp/globalvariables.dart' as globals;


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
  int finalIdx = 9;

  //check if we reached the end of the questions
  bool isEndOfQues(){
    globals.dailiesCompleted = globals.dailiesCompleted+ 0.1;
    return questionIndex >= questions.length;
  }
  
  //check for user picking cprrectanswer
  void pickAnswer(String value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {

      score++;

      print("Correct!\n Score: $score");
    }else {
      print ("Incorrect");
    }

    questionIndex++;


    //if end if questions, go to completed page
    if (isEndOfQues()) {
    // Navigate to CompletePage
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CompletePage()),
        );
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex]; 
    final questionImg = question.imageString;//grabbing first question obj
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

          Padding( 
            padding: const EdgeInsets.only(top:150, left: 100),
            child: Questionletter(imagePath: questionImg)
            ),

          Padding(padding: const EdgeInsets.only(top: 350, left: 80),
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
          ),

          
        ]
      ),
    );
  }
}