import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/textbox.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFAFA0CD),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 90),
              Text(
                "Let's Get You Started!",
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                ),
              const SizedBox(height: 70),
              MyTextBox(controller: firstNameController, hintText: "Enter first name", obscureText: false),

              const SizedBox(height: 15),
              MyTextBox(controller: lastNameController, hintText: "Enter last name", obscureText: false),

              const SizedBox(height: 15),
              MyTextBox(controller: emailController, hintText: "Enter email", obscureText: false),

              const SizedBox(height: 15),
              MyTextBox(controller: passwordController, hintText: "Enter password", obscureText: true),

              ElevatedButton(
              child: const Text("Sign me up!"),
              onPressed: () {
                createnewUser(firstNameController.text, lastNameController.text, emailController.text, passwordController.text);
                
              },
            ),
            ],
          )
        )
      )
    );
  }
}