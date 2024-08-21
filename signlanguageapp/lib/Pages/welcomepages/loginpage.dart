import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/button.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/textbox.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/squareTile.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/dailylogincheck.dart';
import 'package:hive_flutter/hive_flutter.dart';


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
    var login = LoginCounter();
    var box = Hive.box("storagebox");
    var userIDString = box.get("UserID1");
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
                  //reading user's input and search for them in the DB
                  Future<bool> success = readUserInfo(emailController.text, passwordController.text);

                  if (await success == true) {
                    //if user is found, navigate to their userprofile
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => UserProfile(),
                      ),
                    );
                  }

                login.updateLoginCounter("$userIDString");
                  
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