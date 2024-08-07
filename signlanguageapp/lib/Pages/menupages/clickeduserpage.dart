import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/menupages/components/bottomnavbar.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/globalvariables.dart';



class UserProfilePage extends StatefulWidget {
  final Map<String, dynamic> user;

  const UserProfilePage({super.key, required this.user});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String status = "not friends";

  @override
  void initState() {
    super.initState();
    checkFriendshipStatus();
  }

  Future<void> checkFriendshipStatus() async {
    var userId1 = userSession.get("UserID1");
    var userId2 = widget.user['UserID1'];
    print("User 1: $userId1, User 2: $userId2");
    String newStatus = await getFriendshipStatus(userId1, userId2);

    print("Checked status: $status");

    setState(() {
      status = newStatus;
    });
  }

  Future<void> addFriend() async {
    var userId1 = userSession.get("UserID1");
    var userId2 = widget.user['UserID1'];
    String newStatus = await addFriendtoDB(userId1, userId2);

    print("Friend added. Status: $newStatus");

    setState(() {
        status = newStatus;
    });
  }

  Future<void> unaddFriend() async {
    var userId1 = userSession.get("UserID1");
    var userId2 = widget.user['UserID1'];
    String newStatus = await unaddFriendFromDb(userId1, userId2);

    print('Unadding friend: ${widget.user['userID1']}. Status: $newStatus');
    setState(() {
      status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    var fullname = widget.user['firstName'] + " " + widget.user['lastName'];
    
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
                ),
              ),
            ),
            Positioned(
              top: 95,
              right: 145,
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
                  child: widget.user['profilepicture'] == null ||
                          widget.user['profilepicture'] == ""
                      ? Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.grey[400],
                        )
                      : Image.network(
                          "${widget.user['profilepicture']}",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            // Name
            Positioned(
              top: 230,
              left: 150,
              child: Text(
                fullname,
                style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 11, 95, 220),
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
            // Button
            Positioned(
              top: 150,
              left: 260,
              child: TextButton.icon(
                onPressed: () async {
                  if (status == "not friends") {
                    await addFriend();
                  } else {
                    await unaddFriend();
                  }
                },
                icon: Icon(
                  status == "not friends"
                      ? Icons.person_add_alt_rounded
                      : Icons.person_remove_alt_1_rounded,
                ),
                label: Text(
                  status == "not friends"
                      ? 'Add User'
                      : status == "pending"
                          ? 'Pending'
                          : 'Unadd User',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            
            Positioned(
              top: 320,
              left: 30,
              child: Text(
                "Info",
                style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 11, 95, 220),
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
            Positioned(
              top: 340,
              left: 60,
              child: Text(
                "Email: ${widget.user['email']} ",
                style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 11, 95, 220),
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 605),
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}