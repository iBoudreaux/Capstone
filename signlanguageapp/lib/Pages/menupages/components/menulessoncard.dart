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
        color: const Color.fromARGB(255, 127, 172, 42),
        child: Column(
          children: [
            Image.asset(imagePath)
          ],
        )
      ),
    );
  }

}