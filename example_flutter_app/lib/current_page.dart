import 'package:shared_preferences/shared_preferences.dart';

class CurrentPage {
  static Future<void> setPage(String site) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('currentSite', site);
  }

  static Future<String> getPage() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('currentSite') ?? 'null';
  }
}
