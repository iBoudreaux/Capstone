import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:signlanguageapp/Pages/menupages/mainmenu.dart';
import 'package:signlanguageapp/Pages/userprofilepages/userprofilepage.dart';
import 'package:signlanguageapp/Pages/menupages/searchaccounts.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar ({
    super.key,
  });

  @override
  Widget build (BuildContext context){
    return  GNav(
      gap: 8,
      backgroundColor: const Color.fromARGB(172, 111, 149, 42),
      activeColor: Colors.white,
      tabBackgroundColor: const Color.fromARGB(152, 66, 132, 96),
      padding: const EdgeInsets.all(16),
      tabs: [
        GButton(icon: Icons.home, text: "Home", 
        onPressed: () {
          Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => const MainMenu(),
                        ),
                      );
        }
        ),
        const GButton(icon: Icons.calendar_month_outlined, text: "Calendar",),
        GButton(icon: Icons.search_rounded, text:"Search",
        onPressed: () {
          Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => const UserSearchPage(),
                        ),
                      );
        }),
        GButton(icon: Icons.person, text:"Profile",
        onPressed: () {
          Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => UserProfile(),
                        ),
                      );
        })
      ]);
  }

}