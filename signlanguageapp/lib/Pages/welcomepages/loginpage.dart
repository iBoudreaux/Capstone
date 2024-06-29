import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/button.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/textbox.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/squareTile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in method
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAFA0CD),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.waving_hand,
                size: 100
              ),

              //moving the username textbox lower,can replace with logo later
              const SizedBox(height: 50),
              MyTextBox(controller: usernameController, hintText: "Enter Username", obscureText: false),

              const SizedBox(height: 10),
              MyTextBox(controller: passwordController, hintText: "Enter Password", obscureText: true),
              
              const SizedBox(height: 10),
              MyButton(
                onTap: signIn,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.deepPurple[300]
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with'),
                      ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.deepPurple[300]
                      ))
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/Images/googleIcon.png')
                ],
              )
            ],
          )
        )
      )
    );
  }
}
