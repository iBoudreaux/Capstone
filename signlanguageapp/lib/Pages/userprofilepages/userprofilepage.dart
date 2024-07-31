import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signlanguageapp/Pages/menupages/components/bottomnavbar.dart';
import 'package:signlanguageapp/Pages/userprofilepages/overviewpage.dart';



class UserProfile extends StatelessWidget{
  UserProfile({super.key});

  final userSession = Hive.box('storagebox');


  (String, String ) getUserName()
  {
    var firstname = userSession.get('firstname');
    var lastname = userSession.get('lastname');
    var email = userSession.get('email');

    var fullname = firstname + " " + lastname;

    return (fullname, email);
  }



  @override
  Widget build(BuildContext context) {
    var (name, email) = getUserName();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              height: 150,
              width: 450,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 69, 108, 91),
                )
              )
            ),

            const Positioned(
              top:95,
              right:145,
              height: 125,
              width: 125,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 61, 74, 79),
                  shape: BoxShape.circle
                )
              )
            ),
            
            Positioned(
              top:107,
              right:161,
              child: GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if (image == null) return;

                  },
                child: const Icon(Icons.person_outline_sharp, size: 90)
              )
            ),

            Positioned(
              top: 230,
              left: 150,
              child: Text(
                name,
                style: 
                GoogleFonts.montserrat(
                  color:const Color.fromARGB(255, 11, 95, 220), 
                  fontWeight: FontWeight.w600, fontSize: 17),
              )
              ),

            Positioned(
              top: 290,
              left: 30,
              child: Text(
                "Info",
                style: 
                GoogleFonts.montserrat(
                  color:const Color.fromARGB(255, 11, 95, 220), 
                  fontWeight: FontWeight.w600, fontSize: 17),
              )
              ),

              Positioned(
              top: 320,
              left: 60,
              child: Text(
                "Email: $email",
                style: 
                GoogleFonts.montserrat(
                  color:const Color.fromARGB(255, 11, 95, 220), 
                  fontWeight: FontWeight.w600, fontSize: 15),
              )
              ),

              Positioned(
              top: 360,
              left: 60,
              child: Text(
                "Password: *****",
                style: 
                GoogleFonts.montserrat(
                  color:const Color.fromARGB(255, 11, 95, 220), 
                  fontWeight: FontWeight.w600, fontSize: 15),
              )
              ),

              Positioned(
              top: 430,
              left: 30,
              child: Text(
                "Overview",
                style: 
                GoogleFonts.montserrat(
                  color:const Color.fromARGB(255, 11, 95, 220), 
                  fontWeight: FontWeight.w600, fontSize: 17),
              )
              ),

            Positioned(
              top: 420,
              left: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => OverviewPage(),
                        ),
                      );
                },
                child: const Icon(Icons.arrow_forward_rounded,)
              )
              ),

              const Padding(
              padding: EdgeInsets.only(top:605),
              child: 
                BottomNavBar()
              )
          ],
        )
      )
    );
  }


}