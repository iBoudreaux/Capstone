import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/components/bottomnavbar.dart';
class UserProfilePage extends StatefulWidget {
  final Map<String, dynamic> user;

  const UserProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isFriend = false;

  @override
  void initState() {
    super.initState();
    checkFriendshipStatus();
  }

  Future<void> checkFriendshipStatus() async {

    setState(() {
      isFriend = false;
    });
  }

  Future<void> addFriend() async {

    print('Adding friend: ${widget.user['username']}');
    setState(() {
      isFriend = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var fullname = widget.user['firstName'] + " "+ widget.user['lastName'] ;

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
            
            Positioned(
              top:95,
              right:145,
              child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 139, 136, 136),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(62.5), // Half of the width/height
                      child: widget.user['profilepicture'] == null || widget.user['profilepicture'] == "" 
                      ?
                      Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.grey[400],
                      ): Image.network(
                        "${widget.user['profilepicture']}",
                        fit: BoxFit.cover,
                      )
                      
                    ),
                  )
              ),

            Positioned(
              top: 230,
              left: 150,
              child: Text(
                fullname,
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
                "Email: ${widget.user['email']} ",
                style: 
                GoogleFonts.montserrat(
                  color:const Color.fromARGB(255, 11, 95, 220), 
                  fontWeight: FontWeight.w600, fontSize: 15),
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