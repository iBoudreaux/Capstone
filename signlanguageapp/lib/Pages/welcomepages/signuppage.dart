import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/textbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/welcomepages/signupconfirm.dart';
import 'package:signlanguageapp/Pages/welcomepages/components/button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dailyController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dailyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Your existing build method goes here
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 127, 172, 42),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 90),
              Text(
                "Let's Get You Started!",
                style: GoogleFonts.alexandria(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                ),
              
              const SizedBox(height:10),
              Container(
                height: 400,
                width: 300,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 111, 148, 41),
                  boxShadow: const [
                    BoxShadow(
                      color:  Color.fromARGB(255, 174, 183, 54),
                      offset: Offset(-4, -4),
                      blurRadius: 25.0
                      ),
                    BoxShadow(
                      color: Color.fromARGB(255, 53, 105, 79),
                      offset: Offset(4, 4),
                      blurRadius: 25.0
                    )
                  ]
                
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    MyTextBox(controller: firstNameController, hintText: "Enter first name", obscureText: false, boxName: "First Name"),

                    const SizedBox(height: 10),
                    MyTextBox(controller: lastNameController, hintText: "Enter last name", obscureText: false, boxName: "Last Name"),

                    const SizedBox(height: 10),
                    MyTextBox(controller: emailController, hintText: "Enter email", obscureText: false, boxName: "Email"),

                    const SizedBox(height: 10),
                    MyTextBox(controller: passwordController, hintText: "Enter password", obscureText: true, boxName: "Password"),

                    const SizedBox(height: 10),
                    MyTextBox(controller: dailyController, hintText: "Enter your daily goal", obscureText: true, boxName: "Daily Goal"),
                    
                    const SizedBox(height: 40),

                    MyButton(
                      buttonName: "Sign me up!",
                      onTap: () async {
                        Future<bool> success; 
                        success = createnewUser(firstNameController.text, lastNameController.text, emailController.text, passwordController.text, dailyController.text);
                        if (await success == true)
                        {
                          Navigator.push(
                          // ignore: use_build_context_synchronously
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const Signupconfirm(),
                            ),
                          );
                        }
                      }, 
                    ),
                    
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }
}