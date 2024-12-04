import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const _key = 'isDarkMode';

  // Simpan preferensi tema
  Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }

  // Muat preferensi tema
  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false; // Default ke mode terang
  }
}
