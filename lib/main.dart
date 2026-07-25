import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AsendaboApp());
}

class AsendaboApp extends StatelessWidget {
  const AsendaboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asendabo Polytechnic College',
      debugShowCheckedModeBanner: false,
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firebaseStatus = 'Firebase በማገናኘት ላይ...';

  @override
  void initState() {
    super.initState(); // ትክክለኛው የ슈ፐር መጠሪያ
    initFirebaseAndApp();
  }

  Future<void> initFirebaseAndApp() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        firebaseStatus = 'Firebase Successfully Connected!';
      });
    } catch (e) {
      setState(() {
        firebaseStatus = 'የግንኙነት ስህተት አጋጥሟል: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asendabo Polytechnic College'),
        backgroundColor: const Color(0xFF0C62B6),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 80,
                color: Color(0xFF38BDF8),
              ),
              const SizedBox(height: 16),
              const Text(
                'እንኳን ወደ አሰንዳቦ ፖሊቴክኒክ ኮሌጅ መተግበሪያ በደህና መጡ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                firebaseStatus,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C62B6),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardScreen()),
                  );
                },
                child: const Text(
                  'ቀጥታ ግባ (Skip to Dashboard)',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('የኮሌጁ ዳሽቦርድ'),
        backgroundColor: const Color(0xFF0C62B6),
      ),
      body: const Center(
        child: Text(
          'እንኳን ወደ ዋናው ገጽ በሰላም መጡ!',
          style: TextStyle(fontSize: 18, color: Color(0xFF38BDF8)),
        ),
      ),
    );
  }
}
