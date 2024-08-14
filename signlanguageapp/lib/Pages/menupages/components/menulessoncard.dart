import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/menupages/components/progressbar.dart';


class LessonCard extends StatelessWidget {
  final press;
  final String lessonTitle;
  final icon;
  final String percentStr;
  final double percentNum;
  final double? width;


  const LessonCard ({
    super.key,
    required this.press,
    required this.lessonTitle,
    required this.icon, required this.percentStr, required this.percentNum, this.width
  });
  

@override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Set the width of the card
      height: 150, // Set the height of the card
      child: Card(
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40),
                //padding
                const SizedBox(height: 8),
                Text(lessonTitle, textAlign: TextAlign.center),

                //padding
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left:40),
                  child: Progressbar(percentNum: percentNum, percentStr: percentStr, width: width,)
                  )

              ],
            ),
          ),
        ),
      ),
    );
  }
}


