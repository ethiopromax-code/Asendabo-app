import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const AsendaboApp());
}

class AsendaboApp extends StatelessWidget {
  const AsendaboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asendabo Polytechnic College',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF0C62B6),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0C62B6),
          surface: Color(0xFF1E1E1E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1E1E1E),
          selectedItemColor: Color(0xFF0C62B6),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
