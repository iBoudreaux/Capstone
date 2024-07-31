import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/button.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/textbox.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/squareTile.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200),
              MyTextBox(controller: emailController, hintText: "Enter Email", obscureText: false, boxName: "Email"),

              const SizedBox(height: 10),
              MyTextBox(controller: passwordController, hintText: "Enter Password", obscureText: true, boxName: "Password"),
              
              const SizedBox(height: 40),
              MyButton(
                buttonName: "Sign in",
                onTap: () async {
                  Future<bool> success = readUserInfo(emailController.text, passwordController.text);

                  if (await success == true) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => UserProfile(),
                      ),
                    );
                  }
                }, 
              ),

              const SizedBox(height: 50),

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
                      )
                    )
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