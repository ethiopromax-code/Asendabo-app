import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF0C62B6),
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFF38BDF8),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 14, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text('የተማሪው ስም', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text('Level III Student', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 25),
            Card(
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit, color: Color(0xFF38BDF8)),
                    title: const Text('ፕሮፋይል ኤዲት ያድርጉ (Edit Profile)', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  const Divider(height: 1, color: Colors.grey),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Color(0xFF38BDF8)),
                    title: const Text('የይለፍ ቃል ቀይር (Change Password)', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
