import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bacanews/core/theme_provider.dart';
import 'features/profile/provider/profile_provider.dart'; // Import ProfileProvider
import 'app.dart'; // Root widget aplikasi Anda

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                ProfileProvider()), // Tambahkan ProfileProvider
      ],
      child: const App(),
    ),
  );
}
