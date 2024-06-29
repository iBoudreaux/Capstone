import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/loginpage.dart';
import 'package:signlanguageapp/Pages/welcomepages/signuppage.dart';
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
      backgroundColor: const Color(0xFFAFA0CD),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            readUserInfo("hello@gmail.com", "hello");
            Navigator.push(
              context, 
              MaterialPageRoute(
              builder: (context) => LoginPage(),
              ),
            );
          },
        ),

        ElevatedButton(
          child: const Text("Sign Up"),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
              builder: (context) => SignupPage(),
              ),
            );
          },
        ),
          ],
        )
        
      ),
    );
  }
}

