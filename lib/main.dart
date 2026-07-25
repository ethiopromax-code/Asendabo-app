import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AsendaboApp());
}

class AsendaboApp extends StatelessWidget {
  const AsendaboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asendabo Polytechnic College',
      debugShowCheckedModeBanner: false,
      // የመረጥነው የጨለማ ሁነታ (Dark Mode) እና ዋና ቀለሞች (#0C62B6 እና #38BDF8)
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0C62B6),
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0C62B6),
          secondary: Color(0xFF38BDF8),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asendabo Polytechnic College'),
        backgroundColor: const Color(0xFF0C62B6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.school,
              size: 80,
              color: Color(0xFF38BDF8),
            ),
            SizedBox(height: 16),
            Text(
              'እንኳን ወደ አሰንዳቦ ፖሊቴክኒክ ኮሌጅ መተግበሪያ በደህና መጡ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Firebase Successfully Connected!',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
