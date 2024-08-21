import 'package:shared_preferences/shared_preferences.dart';

class LoginCounter {
  Future<void> updateLoginCounter(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final DateTime now = DateTime.now();

    final String lastLoginTimestampKey = 'user_${userId}_lastLoginTimestamp';
    final String loginCountKey = 'user_${userId}_loginCount';

    final int? lastLoginTimestamp = prefs.getInt(lastLoginTimestampKey);

    if (lastLoginTimestamp == null || _has24HoursPassed(lastLoginTimestamp, now)) {
      // If it's the first login or 24 hours have passed, reset the login count to 1
      await prefs.setInt(loginCountKey, 1);
      print("Log in counter reset.");
    } else {
      // Increment the login count if it's within the same 24-hour period
      int loginCount = prefs.getInt(loginCountKey) ?? 0;
      loginCount += 1;
      await prefs.setInt(loginCountKey, loginCount);
      print("User has logged in $loginCount times.");
    }

    // Store the current timestamp as the last login timestamp
    await prefs.setInt(lastLoginTimestampKey, now.millisecondsSinceEpoch);
  }

  Future<int> getLoginCount(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String loginCountKey = 'user_${userId}_loginCount';
    return prefs.getInt(loginCountKey) ?? 0;
  }

  bool _has24HoursPassed(int lastLoginTimestamp, DateTime now) {
    final DateTime lastLoginTime = DateTime.fromMillisecondsSinceEpoch(lastLoginTimestamp);
    final Duration difference = now.difference(lastLoginTime);
    return difference.inHours >= 24;
  }
}