import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:bacanews/theme/colors.dart';
import 'package:bacanews/core/main_page.dart';
import 'package:bacanews/core/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Baca - News App',
          theme: themeProvider.themeData,
          home: const MainPage(),
        );
      },
    );
  }
}
