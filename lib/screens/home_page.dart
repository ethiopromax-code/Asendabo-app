import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // የፖስቶች ዝርዝር (አዳዲስ ፖስቶች ሁልጊዜ ከላይ እንዲመጡ ከፊት ይቀመጣሉ)
  final List<Map<String, dynamic>> posts = [
    {
      'name': 'አቤል ከበደ',
      'role': 'ICT - Level 3 ተማሪ',
      'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
      'title': 'የአሰንዳቦ ፖሊቴክኒክ ኮሌጅ አዲስ የፈጠራ ስራ',
      'description': 'ተማሪዎች በቴክኖሎጂ እና በሶፍትዌር ልማት ያላቸውን አቅም ለማሳደግ የሚያስችል አዲስ የግሩፕ መድረክ ተፈጥሯል!',
      'image': 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=500',
    },
    {
      'name': 'ኮሌጅ አስተዳደር (Admin)',
      'role': 'Asendabo Polytechnic College',
      'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
      'title': 'አዲስ የዲጂታል ላይብረሪ አገልግሎት ተጀመረ',
      'description': 'ተማሪዎች በየትኛውም ሰዓት ትምህርታዊ መጻሕፍትን እና የጥናት ማጣቀሻዎችን በኦንላይን ማግኘት እንዲችሉ አዲሱ የዲጂታል ላይብረሪ ሲስተም መጀመሩን እናሳውቃለን።',
      'image': 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=500',
    },
  ];

  // አዲስ ፖስት ለመጨመር የሚያስችል ዴቨሎፕመንት መስኮት (Dialog)
  void _showAddPostDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text(
            'አዲስ ፖስት መጻፊያ',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'ርዕስ (Title)',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF38BDF8)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descController,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'መግለጫ (Description)',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF38BDF8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ሰርዝ', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0C62B6),
              ),
              onPressed: () {
                if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                  setState(() {
                    // አዲሱ ፖስት ሁልጊዜ ከላይ እንዲገባ (Newest First) ከዝርዝሩ መጀመሪያ ይጨመራል
                    posts.insert(0, {
                      'name': 'አቤል ከበደ (እርስዎ)',
                      'role': 'ICT - Level 3 ተማሪ',
                      'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
                      'title': titleController.text,
                      'description': descController.text,
                      'image': null, // ፎቶ ከሌለ ባዶ ይሁን
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('ለጥፍ (Post)', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildCommonAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 1. የአየር ሁኔታ ካርድ
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFF38BDF8), width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.cloud_outlined, color: Color(0xFF38BDF8), size: 28),
                          SizedBox(width: 10),
                          Text(
                            'የአሰንዳቦ ከተማ የአየር ሁኔታ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '24°C',
                        style: TextStyle(
                          color: Color(0xFF38BDF8),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, height: 20),
                  const Text(
                    'መለስተኛ ፀሐያማ እና ደመናማ (Partly Cloudy)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'በዚህ ሳምንት በአሰንዳቦ ፖሊቴክኒክ ኮሌጅ እና አካባቢው የሚኖረው የአየር ሁኔታ ለተማሪዎች እንቅስቃሴ ምቹ ነው።',
                    style: TextStyle(fontSize: 12, color: Colors.grey[300], height: 1.3),
                  ),
                ],
              ),
            ),
          ),

          // 2. ፖስት ለመጨመር የሚያስችል ቁልፍ (Action Banner)
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0C62B6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => _showAddPostDialog(context),
              icon: const Icon(Icons.add_circle_outline),
              label: const Text(
                'አዲስ ሐሳብ ወይም ማስታወቂያ አጋራ (Create Post)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),

          // 3. የፖስቶች ዝርዝር (Dynamic Posts)
          ...posts.map((post) => Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 4,
                color: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(post['avatar']),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                post['role'],
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(color: Colors.grey, height: 20),
                      Text(
                        post['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        post['description'],
                        style: TextStyle(fontSize: 12, color: Colors.grey[300], height: 1.3),
                      ),
                      if (post['image'] != null) ...[
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            post['image'],
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
