import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bacanews/theme/colors.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;
  bool _isDarkMode;

  ThemeProvider()
      : _isDarkMode = false,
        _themeData = ThemeData.light().copyWith(
          primaryColor: AppColors.azureRadiance,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
          cardColor: AppColors
              .athenasGray, // Warna latar belakang kartu untuk tema terang
        );

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool isDark) async {
    _isDarkMode = isDark;
    _themeData = isDark
        ? ThemeData.dark().copyWith(
            primaryColor: AppColors.azureRadiance,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
            cardColor: const Color(
                0xFF1E1E1E), // Warna kartu hitam muda untuk tema gelap
            iconTheme: IconThemeData(color: Colors.white),
          )
        : ThemeData.light().copyWith(
            primaryColor: AppColors.azureRadiance,
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
            cardColor: AppColors.athenasGray,
          );

    // Simpan preferensi tema ke shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);

    notifyListeners();
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = _isDarkMode
        ? ThemeData.dark().copyWith(
            primaryColor: AppColors.azureRadiance,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
            cardColor: const Color(0xFF1E1E1E),
          )
        : ThemeData.light().copyWith(
            primaryColor: AppColors.azureRadiance,
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
            cardColor: AppColors.athenasGray,
          );
    notifyListeners();
  }
}
