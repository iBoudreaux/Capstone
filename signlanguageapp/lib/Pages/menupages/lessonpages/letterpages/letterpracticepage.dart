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
  late int finalIdx;
  bool answerSelected = false;


  @override
  void initState() {
    super.initState();
    finalIdx = questions.length - 1; // Set finalIdx to the last index of questions
  }

  bool isEndOfQues() {
    return questionIndex >= questions.length - 1;
  }

  void pickAnswer(String value) {
    if (answerSelected) return; // Prevent multiple selections

    setState(() {
      selectedAnswerIndex = value;
      answerSelected = true;
    });

    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
      print("Correct!\n Score: $score");
    } else {
      print("Incorrect");
    }

    // Wait for 2 seconds before moving to the next question or ending the lesson
    Future.delayed(const Duration(seconds: 2), () {
      if (isEndOfQues()) {
        globals.dailiesCompleted = globals.dailiesCompleted + 0.1;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Lessoncomplete(
              score: score,
              totalQuestions: questions.length,
            ),
          ),
        );
      } else {
        setState(() {
          questionIndex++;
          selectedAnswerIndex = null;
          answerSelected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionIndex >= questions.length) {
      // This should not happen, but just in case
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question = questions[questionIndex];
    final questionImg = question.imageString;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 30),
            child: Text(
              "Try it yourself.\n${question.question}",
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 100),
            child: Questionletter(imagePath: questionImg),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350, left: 80),
            child: SizedBox(
              width: 250,
              height: 250,
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: question.options.map((option) {
                  return GestureDetector(
                    onTap: () => pickAnswer(option),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 242, 199),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: getBorderColor(option, question.correctAnswerIndex),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

// changes the border color of the answer choices
  Color getBorderColor(String option, String correctAnswer) {
    if (selectedAnswerIndex == null) return Colors.transparent;
    if (option == correctAnswer) return const Color.fromARGB(255, 45, 130, 48);
    if (option != correctAnswer) return const Color.fromARGB(255, 255, 75, 62);
    return Colors.transparent;
  }
}