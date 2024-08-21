import 'package:mysql_client/mysql_client.dart';
import 'package:hive_flutter/hive_flutter.dart';


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

Future<void> createNewEvent(String userID, String eventName, String description, DateTime eventDate) async 
{
  var conn =  await connectToDatabase();
  await conn.connect();

  try {
    // Format the date to MySQL datetime format
    String formattedDate = eventDate.toUtc().toString().split('.')[0];

    await conn.execute(
      "INSERT INTO calendarevents (userIDString, eventName, description, eventDate) VALUES (:userIDString, :eventName, :description, :eventDate)",
      {
        'userIDString': userID, 
        'eventName': eventName, 
        'description': description, 
        'eventDate': formattedDate
      }
    );

    print("Event created.");
  } catch (e) {
    print("Error creating event: $e");
  } finally {
    await conn.close();
  }

}

Future<List<Map<String, dynamic>>> getEvents(String userIDString) async {
  var conn = await connectToDatabase();
  await conn.connect();

  try {
    // Execute the query to get events for the user
    var result = await conn.execute("SELECT eventName, description, eventDate FROM CalendarEvents WHERE userIDString = '$userIDString'");

    // Create a list to store event data
    final List<Map<String, dynamic>> events = [];

    // Populate the list with results
    for (var row in result.rows) {
      events.add({
        'eventName': row.colByName('eventName'),
        'description': row.colByName('description'),
        'eventDate': row.colByName('eventDate'),
      });
    }

    return events;
  } catch (e) {
    print("Error fetching events: $e");
    return []; // Return an empty list if there's an error
  } finally {
    // Close the connection
    await conn.close();
  }
}


