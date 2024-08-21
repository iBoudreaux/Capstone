import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/databaseconn.dart';
import 'package:signlanguageapp/Pages/menupages/components/bottomnavbar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:signlanguageapp/Pages/menupages/calendar/calendardb.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _MyCalendarPageState createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<CalendarPage> {
  final userSession = Hive.box('storagebox');
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    var userID = userSession.get("UserID1");
    try {
      var fetchedEvents = await getEvents(userID);
      setState(() {
        _events = _convertToEventMap(fetchedEvents as List);
      });
    } catch (e) {
      print("Error fetching events: $e");
      // Handle error (e.g., show a snackbar)
    }
  }

  Map<DateTime, List<Event>> _convertToEventMap(List<dynamic> fetchedEvents) {
    Map<DateTime, List<Event>> eventMap = {};
    for (var event in fetchedEvents) {
      DateTime date = DateTime.parse(event['eventDate']);
      DateTime normalizedDate = DateTime.utc(date.year, date.month, date.day);
      if (eventMap[normalizedDate] == null) {
        eventMap[normalizedDate] = [];
      }
      eventMap[normalizedDate]!.add(Event(event['eventName'], event['description']));
    }
    return eventMap;
  }

  List<Event> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);
    return _events[normalizedDay] ?? [];
  }

  void _showEventDetails(Event event) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(event.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text(event.description),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addEvent() {
    var userID = userSession.get("UserID1");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController();
        final descriptionController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                //grabbing text
                final eventName = titleController.text;
                final description = descriptionController.text;

              //if text boxes aren't empty, add them to the events array
                if (eventName.isNotEmpty && description.isNotEmpty) {
                  final selectedDay = _selectedDay ?? _focusedDay;
                  final normalizedDay = DateTime.utc(selectedDay.year, selectedDay.month, selectedDay.day);

                  //databse call
                  createNewEvent(userID, eventName, description, selectedDay);


                  setState(() {
                    if (_events[normalizedDay] != null) {
                      _events[normalizedDay]!.add(Event(eventName, description));
                    } else {
                      _events[normalizedDay] = [Event(eventName, description)];
                    }
                  });

                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var userID = userSession.get("UserID1");
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      ),
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getEventsForDay,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay ?? _focusedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay ?? _focusedDay)[index];
                return ListTile(
                  title: Text(event.title),
                  onTap: () => _showEventDetails(event),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                    onPressed: _addEvent,
                    backgroundColor: const Color.fromARGB(255, 127, 172, 42),
                    child: const Icon(Icons.add),
                  ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: BottomNavBar(),
          ),
        ],
      ),

    );
  }
}

class Event {
  final String title;
  final String description;

  Event(this.title, this.description);

  @override
  String toString() => title;
}