import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main_navigation_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isValidGmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$").hasMatch(email);
  }

  void _handleSignup() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('እባክዎ ሁሉንም ባዶ ቦታዎች ይሙሉ'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (!_isValidGmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('እባክዎ ትክክለኛ የጂሜይል (Gmail) አድራሻ ይጠቀሙ'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('የይለፍ ቃል ቢያንስ ከ 6 ፊደላት በላይ መሆን አለበት'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('የይለፍ ቃሎቹ እርስ በእርስ አልተመሳሰሉም'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // ተጠቃሚውን ወደ መዝገብ ቤት መጨመር
    AppDatabase.registeredUsers.add({
      'email': email,
      'password': password,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('አካውንትዎ በሳካ ሁኔታ ተፈጥሯል!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('አካውንት መፍጠሪያ', style: TextStyle(color: Colors.white)),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.person_add_rounded,
                  size: 80,
                  color: Color(0xFF0C62B6),
                ),
                const SizedBox(height: 24),
                const Text(
                  'አዲስ አካውንት ይፍጠሩ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'ጂሜይል አድራሻ (name@gmail.com)',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF0C62B6)),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'የአፑ መለያ የይለፍ ቃል (Password)',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF0C62B6)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'የይለፍ ቃል ያረጋግጡ',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.lock_reset, color: Color(0xFF0C62B6)),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSignup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C62B6),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'ይመዝገቡ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
