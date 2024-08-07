library globals;
import 'package:hive_flutter/hive_flutter.dart';


var dailiesCompleted = 0.0;

int numOfLessons = 5;

final userLoggedIn = Hive.box('storagebox');

var dailyGoal = userLoggedIn.get("dailygoal");

