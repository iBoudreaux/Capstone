import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;

  const MyButton ({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration:  BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 30.0,
              offset: Offset(0.0, 5.0),
              blurStyle: BlurStyle.inner
            )
          ],
          color: const Color.fromARGB(255, 206, 133, 201),
          borderRadius: BorderRadius.circular(30),
          
        ),
        child: const Center(
          child: Text(
          "Sign in",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}