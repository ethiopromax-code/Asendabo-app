import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primaryColor: const Color(0xFF0C62B6), // ተቋማዊ ሰማያዊ ቀለም
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0C62B6)),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// ==========================================
// 1. የ Bottom Navigation ተቆጣጣሪ
// ==========================================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // የBottom Navigation ገጾች ዝርዝር
  final List<Widget> _pages = const [
    HomePage(),       // ገጽ 1፦ Home
    ChatPage(),       // ገጽ 2፦ Chat
    SizedBox.shrink(), // ገጽ 3፦ ለ [+] (Plus) ክፍት ቦታ
    ProfilePage(),    // ገጽ 4፦ Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      
      // መሀል ላይ ጎልታ የምትወጣዋ የፕላስ (+) ቁልፍ
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // [+] ሲጫን የሚፈጠር ክስተት
          _showPostOptions(context);
        },
        backgroundColor: const Color(0xFF0C62B6),
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 36, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // አዲሱ እና ዘመናዊው የNavigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 1. Home
              _buildNavItem(
                index: 0,
                label: 'Home',
                activeIcon: Icons.home_filled,
                inactiveIcon: Icons.home_outlined,
              ),

              // 2. Chat
              _buildNavItem(
                index: 1,
                label: 'Chat',
                activeIcon: Icons.forum,
                inactiveIcon: Icons.forum_outlined,
              ),

              // ለ FloatingActionButton የሚሆን ክፍት ቦታ (መሃል ላይ)
              const SizedBox(width: 50),

              // 4. Profile
              _buildNavItem(
                index: 3,
                label: 'Profile',
                activeIcon: Icons.account_circle,
                inactiveIcon: Icons.account_circle_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // የ Navigation ንጥሎችን ለመገንባት (Reusable Widget)
  Widget _buildNavItem({
    required int index,
    required String label,
    required IconData activeIcon,
    required IconData inactiveIcon,
  }) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : inactiveIcon,
            color: isSelected ? const Color(0xFF0C62B6) : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF0C62B6) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // [+] ሲጫን የሚመጣ ቀለል ያለ Menu
  void _showPostOptions(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('እዚህ ጋር አዲስ ፖስት የመፍጠር ተግባር ይኖራል')),
    );
  }
}

// ==========================================
// 2. የተወሰኑ Widgetዎችን እንደገና ለመጠቀም (Reusable Widgets)
// ==========================================

// ሀ. የተቋሙ አርማ (Profile Avatar)
class CollegeAvatar extends StatelessWidget {
  final double size;
  const CollegeAvatar({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: const Color(0xFF0C62B6),
      child: const Icon(Icons.school, color: Colors.white, size: 20),
    );
  }
}

// ለ. የጋራ አፕ ባር (Common AppBar)
AppBar buildCommonAppBar() {
  return AppBar(
    title: const Text('Asendabo Polytechnic College', style: TextStyle(fontSize: 18)),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: CollegeAvatar(), // የአርማው ቦታ
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text('LV III', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ],
  );
}

// ==========================================
// 3. የገጾቹ ይዘት (Page Content Widgets)
// ==========================================

// ገጽ 1፦ Home (ፖስቶች የሚነበቡበት ገጽ)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5, // የናሙና ፖስቶች ብዛት
        itemBuilder: (context, index) {
          return const PostCard(); // የፖስት ካርድ (ካለፈው ኮድ የተወሰደ)
        },
      ),
    );
  }
}

// ገጽ 2፦ Chat (የቡድን ውይይት ገጽ)
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: ListView(
        children: const [
          ChatGroupTile(groupName: 'ICT Level III Students', lastMessage: 'ሰላም! ዛሬ ምሳ የት ነው?'),
          ChatGroupTile(groupName: 'Electronics Staff Group', lastMessage: 'ከስብሰባው በፊት ሰነዱን ይመልከቱ'),
        ],
      ),
    );
  }
}

// ገጽ 4፦ Profile (የግል መረጃ ማሻሻያ ገጽ)
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // የናሙና መረጃዎች
  String _userName = 'ዳዊት አሰፋ';
  String _profileImage = ''; // 'images/david.jpg' if exist

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // ትልቁ የፕሮፋይል ፎቶ
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _profileImage.isNotEmpty ? AssetImage(_profileImage) : null,
                    child: _profileImage.isEmpty
                        ? const Icon(Icons.person, size: 80, color: Colors.grey)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                        onPressed: () {
                          // ፎቶ ለመቀየር onPressed
                          _pickImage(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(_userName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            // የመረጃ ማሻሻያ ዝርዝር
            ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('ስም ይቀይሩ'),
              onTap: () {
                _editName(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('የይለፍ ቃል ቀይሩ'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _pickImage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ፎቶ መራጭ Menú ይመጣል')));
  }

  void _editName(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('የስም ማስተካከያ Dialog ይመጣል')));
  }
}

// ==========================================
// 4. የተጨማሪ Widget ክፍሎች (UI Components)
// ==========================================

// የፖስት ካርድ (ካለፈው ኮድ የተወሰደ)
class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('አዲስ የትምህርት ፖሊሲ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('ከዚህ ቀደም የነበረው የICT ሥርዓተ-ትምህርት ተሻሽሏል...', maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: const Text('ተጨማሪ', style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0C62B6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                ),
                child: const Center(child: Icon(Icons.public, size: 60, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// የቻት ቡድን ንጥል (Chat Group Tile)
class ChatGroupTile extends StatelessWidget {
  final String groupName;
  final String lastMessage;
  const ChatGroupTile({super.key, required this.groupName, required this.lastMessage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.group)),
      title: Text(groupName),
      subtitle: Text(lastMessage),
      onTap: () {},
    );
  }
}
