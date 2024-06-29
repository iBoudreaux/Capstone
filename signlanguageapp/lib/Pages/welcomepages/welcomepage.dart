import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/loginpage.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _HomePageState();
}

class _HomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      body: Center(
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            readUserInfo();
            // Navigator.push(
            //   context, 
            //   MaterialPageRoute(
            //   builder: (context) => LoginPage(),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}

