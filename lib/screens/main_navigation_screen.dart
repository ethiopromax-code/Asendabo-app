import 'package:flutter/material.dart';
import 'home_page.dart';
import 'chat_page.dart';
import 'notification_page.dart';
import 'profile_page.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ChatPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostDialog(context),
        backgroundColor: const Color(0xFF0C62B6),
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, 'መነሻ', Icons.home, Icons.home_outlined),
              _buildNavItem(1, 'ቻት', Icons.chat_bubble, Icons.chat_bubble_outline),
              const SizedBox(width: 48),
              _buildNavItem(2, 'ማሳወቂያ', Icons.notifications, Icons.notifications_outlined),
              _buildNavItem(3, 'መገለጫ', Icons.person, Icons.person_outline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData activeIcon, IconData inactiveIcon) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : inactiveIcon,
            color: isSelected ? const Color(0xFF38BDF8) : Colors.grey[500],
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF38BDF8) : Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  void _showPostDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20, left: 20, right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'አዲስ ፖስት ያድርጉ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'ርዕስ (Title)',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'መግለጫ (Description)...',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  side: const BorderSide(color: Color(0xFF38BDF8)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ፎቶ ተመርጧል!')),
                  );
                },
                icon: const Icon(Icons.photo_library, color: Color(0xFF38BDF8)),
                label: const Text('ፎቶ ምረጡ (Upload Photo)', style: TextStyle(color: Color(0xFF38BDF8))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C62B6),
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ፖስቱ ወደ መነሻ ገጽ (Home) ተልኳል!'),
                      backgroundColor: Color(0xFF0C62B6),
                    ),
                  );
                },
                child: const Text('ለጥፍ (Post)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildCommonAppBar() {
  return AppBar(
    title: const Text('Asendabo Polytechnic C...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
    actions: const [
      CircleAvatar(
        radius: 16,
        backgroundColor: Color(0xFF0C62B6),
        child: Icon(Icons.person, size: 20, color: Colors.white),
      ),
      SizedBox(width: 8),
      Center(
        child: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text('LV III', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    ],
  );
}
