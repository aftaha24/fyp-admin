import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  Future<bool> setSharedToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDone = await prefs.setString('token', token);
    return isDone;
  }

  Future<String?> getSharedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void removeSharedService() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
