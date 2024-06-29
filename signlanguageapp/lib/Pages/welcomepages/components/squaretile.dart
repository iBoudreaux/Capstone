import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 30.0,
              offset: Offset(0.0, 7.0),
              blurStyle: BlurStyle.inner
            )
          ],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFD1C0F1)
      ),
      child: Image.asset(
        imagePath,
        height: 40
        )
    );
    
  }
}