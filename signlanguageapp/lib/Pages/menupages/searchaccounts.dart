import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/menupages/clickeduserpage.dart';

class UserSearchPage extends StatefulWidget {
  const UserSearchPage({super.key});

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  void _searchUsers(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    var results = await findAUser(query);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter username',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchUsers(_searchController.text),
                ),
              ),
              onChanged: _searchUsers,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final user = _searchResults[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(user['firstName'], style: GoogleFonts.montserrat()),
                      subtitle: Text(user['email'], style: GoogleFonts.montserrat()),
                      onTap: () {
                        Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => UserProfilePage(user: user),
                        ),
                      );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}