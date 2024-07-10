import 'package:flutter/material.dart';

class Arrowbutton extends StatelessWidget {
  const Arrowbutton ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child:
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(255, 59, 25, 22),
              blurRadius: 0.0,
              offset: Offset(3.0, 0),
              blurStyle: BlurStyle.inner,
              spreadRadius: 5.0
            ),
            BoxShadow(
              color: Color.fromARGB(255, 78, 30, 26),
              blurRadius: 0.0,
              offset: Offset(-3.0, 0),
              blurStyle: BlurStyle.inner,
              spreadRadius: 5.0
            )
          ],
          )

          ),
    );
  }
}