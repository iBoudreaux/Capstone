import 'dart:math';

import 'package:mysql_client/mysql_client.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Var to  hold user session
var userSession = Hive.box('storagebox');


String generateUserId() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    
    String randomPart = '';
    for (int i = 0; i < 30; i++) {
      if (i == 10 || i == 20) {
        randomPart += '-';
      } else {
        randomPart += chars[random.nextInt(chars.length)];
      }
    }
    
    return randomPart;
  }


Future<MySQLConnection> connectToDatabase () async 
{
  final conn = await MySQLConnection.createConnection(
      host: "10.0.2.2", // Add your host IP address or server name
      port: 3306, // Add the port the server is running on
      userName: "root", // Your username
      password: "test", // Your password
      databaseName: "asl_app_schema", // Your DataBase name
    );
    
    return conn;
}

Future<bool> createnewUser(String firstName, String lastName, String email, String password, String dailyGoal) async 
{
  // ignore: prefer_typing_uninitialized_variables
  var conn =  await connectToDatabase();

  var daily = int.parse(dailyGoal);
  await conn.connect();

  if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || dailyGoal.isEmpty){
    print("Please enter in all information above.");
  await conn.close();

    return false;
  }
  else{
    String userID = generateUserId();

    var results  = await conn.execute("SELECT * FROM users WHERE UserIDString = '$userID'");
    if (results.isNotEmpty){
      userID = generateUserId();
    } else {
      

    await conn.execute(
      "INSERT INTO users (firstName, lastName, email, password, dailyGoal) VALUES (:firstName, :lastName, :email, :password, :dailyGoal)",
      {'firstName': firstName, 'lastName': lastName, 'email': email, 'password': password, 'dailyGoal': daily, 'userIDString': userID});

    }
    
    readUserInfo(email, password);

      return true;
  }
  

}

Future<bool> readUserInfo(String email, String password) async 
{
  var conn =  await connectToDatabase();

  await conn.connect();
  var result = await conn.execute("SELECT * FROM Users WHERE email = '$email' and password = '$password'");

  if (result.rows.isEmpty )
  {
    print("User cannot be found/doesn't exist.");
    await conn.close();

    return false;
  }
  else 
  {
    for (var element in result.rows) {
    Map data = element.assoc();

    userSession.put("userID", data['userID']);
    userSession.put("firstname", data['firstName']);
    userSession.put("lastname", data['lastName']);
    userSession.put("email", data['email']);
    userSession.put("dailygoal", data['dailyGoal']);
    userSession.put("picture", data['profilepicture']);
    userSession.put("UserID1",data["userIDString"]);


    }
  
    await conn.close();

    return true;
    }
  }

  void logoutUser () {
    userSession.clear();
  }

  Future<void> updateUserInfo (String fieldName, String value) async 
  {
    var conn =  await connectToDatabase();
    await conn.connect();

    var userID = userSession.get("userID");

    await conn.execute("UPDATE users SET $fieldName = '$value' WHERE userID = '$userID'");

  }

Future<List<Map<String, dynamic>>> findAUser(String username) async {
  var conn = await connectToDatabase();
  await conn.connect();

  var emailstr = userSession.get("email");

  var results = await conn.execute("SELECT * FROM users WHERE (firstName = '$username' OR firstName LIKE '%$username%') AND email <> '$emailstr'");

  List<Map<String, dynamic>> users = [];
  for (var row in results.rows) {
    users.add({
      'firstName': row.colByName('firstName'),
      'lastName': row.colByName('lastName'),
      'email': row.colByName('email'),
      'profilepicture': row.colByName('profilepicture'),
      'UserID1': row.colByName('userIDString')
    });
  }

  await conn.close();
  return users;
}

Future<void> updateProfilePicture (String image) async 
  {
    var conn =  await connectToDatabase();
    await conn.connect();

    var userID = userSession.get("userID");

    await conn.execute("UPDATE users SET profilepicture = '$image' WHERE userID = '$userID'");

  }

Future<String> getFriendshipStatus(String userid1, String userid2) async {
    var status;
    try {
      var conn = await connectToDatabase();
      await conn.connect();

      var results = await conn.execute(
        "SELECT status from friendships where UserID1 = '$userid1' and UserID2 = '$userid2'"
      );
      
      if (results.isNotEmpty) {
        status = results.rows.first.colByName("Status");
      } else {
        status = "not friends";
      }

      return status;
  }

  catch (e) {
      print('Error adding friend: $e');
      return "not friends";
    }

}


  Future<String> addFriendtoDB(String userId1, String userId2) async {
    String status = "friends";

    try {
      var conn = await connectToDatabase();
      await conn.connect();

      String friendshipID;
      var hasRes = true;

      do {
        friendshipID = generateUserId();

        var results = await conn.execute("SELECT * FROM friendships WHERE FriendshipID = '$friendshipID'");

        print(results);

        if (results.isEmpty) hasRes = false;

      } while(hasRes);


      await conn.execute("INSERT INTO friendships (FriendshipID, UserID1, UserID2, status) VALUES (:FriendshipID, :UserID1, :UserID2, :status)",
      {'FriendshipID': friendshipID, 'UserID1': userId1, 'UserID2': userId2, 'status': status});

      return status;

    } catch (e) {
      print('Error adding friend: $e');
      status = "not friends";
      return status;
    }
  }

  Future<String> unaddFriendFromDb(String userId, String userId2) async {
    String status;
    try {
      var conn = await connectToDatabase();
      await conn.connect();

      await conn.execute("DELETE FROM friendships where UserID1 = '$userId' AND UserID2 = '$userId2'");
      status = "not friends";
      return status;

    } catch (e) {
      status = "friends";
      print('Error unadding friend: $e');
      return status;
    }
  }


