import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;


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

void createnewUser() async 
{
  // ignore: prefer_typing_uninitialized_variables
  var conn =  await connectToDatabase();

  await conn.connect();

  await conn.execute(
    "INSERT INTO users (firstName, lastName, email, password) VALUES (:firstName, :lastName, :email, :password)",
    {'firstName': 'Stefen', 'lastName': 'Priest', 'email': 'stefenEmail@gmail.com', 'password': 'hello'});

  await conn.close();
}

Future<void> readUserInfo() 
async {
  var conn =  await connectToDatabase();

  await conn.connect();
  var result = await conn.execute('SELECT * FROM Users');

for (var element in result.rows) {
  Map data = element.assoc();
  print('Id: ${data['userID']}, firstName: ${data['firstName']}, lastName: ${data['lastName']}, email: ${data['email']}, password: ${data['password']}');
  }

  await conn.close();
}