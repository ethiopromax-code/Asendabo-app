import 'package:flutter/material.dart';
import 'main_navigation_screen.dart'; // ሎጊን ሲደረግ ወደሚወስደው ዋናው ገጽ

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark Theme Background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // የኮሌጁ አርማ ወይም አዶ
                const Icon(
                  Icons.school_rounded,
                  size: 80,
                  color: Color(0xFF0C62B6),
                ),
                const SizedBox(height: 24),
                
                // ርዕስ (Title)
                const Text(
                  'እንኳን ደህና መጡ\nወደ አካውንትዎ ይግቡ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 32),

                // የኢሜይል / ስልክ ቁጥር ማስገቢያ
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'ኢሜይል ወይም ስልክ ቁጥር',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF0C62B6)),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // የይለፍ ቃል ማስገቢያ
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'የይለፍ ቃል',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF0C62B6)),
                    suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // የመግቢያ ቁልፍ (Login Button)
                ElevatedButton(
                  onPressed: () {
                    // ተጠቃሚው "ግባ" ሲጫን ወደ MainNavigationScreen ይሄዳል
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavigationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C62B6),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'ግባ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // አካውንት የሌላቸው ወደ መመዝገቢያ ማዘዋወሪያ
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'አካውንት የለዎትም? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Sign Up ገጽ ሲኖር እዚህ ጋር ማገናኘት ይቻላል
                      },
                      child: const Text(
                        'አካውንት ይፍጠሩ',
                        style: TextStyle(
                          color: Color(0xFF0C62B6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
