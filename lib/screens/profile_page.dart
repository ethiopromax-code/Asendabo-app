import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildCommonAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // የፕሮፋይል ፎቶ እና ዋና ስም
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF0C62B6),
                    child: CircleAvatar(
                      radius: 47,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'አቤል ከበደ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'አሰንዳቦ ፖሊቴክኒክ ኮሌጅ • ተማሪ',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C62B6).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF0C62B6)),
                    ),
                    child: const Text(
                      'ICT - Level 3',
                      style: TextStyle(
                        color: Color(0xFF38BDF8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // የምናሌ አማራጮች (Menu Options)
            _buildProfileMenuItem(
              icon: Icons.person_outline,
              title: 'የግል መረጃ (Personal Info)',
              onTap: () {},
            ),
            _buildProfileMenuItem(
              icon: Icons.school_outlined,
              title: 'የክፍል እና የውጤት ታሪክ',
              onTap: () {},
            ),
            _buildProfileMenuItem(
              icon: Icons.notifications_none,
              title: 'የማሳወቂያ ምርጫዎች',
              onTap: () {},
            ),
            _buildProfileMenuItem(
              icon: Icons.security_outlined,
              title: 'የይለፍ ቃል መቀየሪያ (Password)',
              onTap: () {},
            ),
            _buildProfileMenuItem(
              icon: Icons.info_outline,
              title: 'ስለ ኮሌጁ (About College)',
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // ከመተግበሪያው የመውጫ ቁልፍ (Logout Button)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: const Text(
                  'ከአካውንት ውጣ (Logout)',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  // የማረጋገጫ መልዕክት ወይም ወደ መግቢያ ገጽ የመመለሻ ቦታ
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ከአካውንትዎ ወጥተዋል።'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // የምናሌ ዝርዝር መስመር ማሰናጃ ሄልፐር ዊጅት
  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF38BDF8)),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
