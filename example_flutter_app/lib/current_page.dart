import 'package:shared_preferences/shared_preferences.dart';

class CurrentPage {
  static Future<void> setPage(String site) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    // set value
    await prefs.setString('currentSite', site);
  }

  static Future<String> getPage() async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    //debugPrint(prefs.getString('currentSite'));
    print(prefs.getString('currentSite'));

    // get value
    return prefs.getString('currentSite') ?? 'null';
  }
}
