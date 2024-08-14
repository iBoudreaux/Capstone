import 'package:shared_preferences/shared_preferences.dart';

class LoginCounter {
  Future<void> updateLoginCounter(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String currentDate = DateTime.now().toIso8601String().substring(0, 10); // YYYY-MM-DD format

    final String lastLoginDateKey = 'user_${userId}_lastLoginDate';
    final String loginCountKey = 'user_${userId}_loginCount';

    final String? lastLoginDate = prefs.getString(lastLoginDateKey);

    if (lastLoginDate == null || lastLoginDate != currentDate) {
      // Reset the login count if the date has changed
      await prefs.setInt(loginCountKey, 1);
    } else {
      // Increment the login count if it's the same day
      int loginCount = prefs.getInt(loginCountKey) ?? 0;
      loginCount += 1;
      await prefs.setInt(loginCountKey, loginCount);
    }

    await prefs.setString(lastLoginDateKey, currentDate);
  }

  Future<int> getLoginCount(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String loginCountKey = 'user_${userId}_loginCount';
    return prefs.getInt(loginCountKey) ?? 0;
  }
}