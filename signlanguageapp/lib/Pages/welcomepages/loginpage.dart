import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/button.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/textbox.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/squareTile.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  //sign in method
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              

              //moving the username textbox lower,can replace with logo later
              const SizedBox(height: 200),
              MyTextBox(controller: emailController, hintText: "Enter Email", obscureText: false, boxName: "Email"),

              const SizedBox(height: 10),
              MyTextBox(controller: passwordController, hintText: "Enter Password", obscureText: true, boxName: "Password"),
              
              const SizedBox(height: 40),
              MyButton(
                buttonName: "Sign in",
                onTap: () async {
                        Future<bool> success; 
                        success = readUserInfo(emailController.text, passwordController.text);

                        if (await success == true)
                        {
                          Navigator.push(
                          // ignore: use_build_context_synchronously
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
