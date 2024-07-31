import 'package:mysql_client/mysql_client.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Var to  hold user session
var userSession = Hive.box('storagebox');


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
    await conn.execute(
      "INSERT INTO users (firstName, lastName, email, password, dailyGoal) VALUES (:firstName, :lastName, :email, :password, :dailyGoal)",
      {'firstName': firstName, 'lastName': lastName, 'email': email, 'password': password, 'dailyGoal': daily});

    
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


    }
  
    await conn.close();

    return true;
    }
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

  var results = await conn.execute("SELECT * FROM users WHERE firstName = '$username' OR firstName LIKE '%$username%'");

  List<Map<String, dynamic>> users = [];
  for (var row in results.rows) {
    users.add({
      'firstName': row.colByName('firstName'),
      'email': row.colByName('email'),
      'profilepicture': row.colByName('profilepicture')
    });
  }

  await conn.close();
  return users;
}


