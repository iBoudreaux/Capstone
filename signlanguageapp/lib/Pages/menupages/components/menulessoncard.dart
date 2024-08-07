import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/menupages/lessonpages/letterpages/basiclessonletterpage.dart';

class LessonCard extends StatelessWidget {
  final String imagePath;
  const LessonCard ({
    super.key,
    required this.imagePath
  });

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => LetterPage(),
                        ),
                      );
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 97, 128, 41),
          border: Border.all(
            color: const Color.fromARGB(255, 97, 128, 41),
            width: 6
          ), borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Image.asset(imagePath)
          ],
        )
      ),
    );
  }

}