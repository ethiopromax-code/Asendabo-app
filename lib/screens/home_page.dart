import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'name': 'አበበ ከበደ',
        'role': 'ICT - Level 3 ተማሪ',
        'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
        'title': 'Developed by the United Nations',
        'description': 'The 17 Global Goals, also called the Sustainable Development Goals (SDGs) are a urgent call for action by all countries...',
        'image': 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500',
      },
      {
        'name': 'መ/ር አበበ (Dept Head)',
        'role': 'Building Electrical Instructor',
        'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=100',
        'title': 'የሕንፃ ኤሌክትሪክ ዝርጋታ ስልጠና',
        'description': 'ለሁሉም የደረጃ 4 ተማሪዎች የሚደረግ የተግባር (Practical) መርሃ-ግብር ከሰዓት በኋላ በላብራቶሪ ይካሄዳል።',
        'image': 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=500',
      },
      {
        'name': 'ኮሌጅ አስተዳደር (Admin)',
        'role': 'Asendabo Polytechnic College',
        'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
        'title': 'አዲስ የፈተና መርሃ-ግብር ማስታወቂያ',
        'description': 'የመጀመሪያ ሴሚስተር የናሙና ፈተናዎች ከቀጣይ ሳምንት ጀምሮ ይሰጣሉና ተማሪዎች ራሳችሁን እንዲያዘጋጁ እናሳስባለን።',
        'image': null,
      },
      {
        'name': 'ሀይማኖት ታደሰ',
        'role': 'Accounting - Level 2',
        'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
        'title': 'የግሩፕ ጥናት ስብሰባ',
        'description': 'ዛሬ ከሰዓት በኋላ በቤተ-መጽሐፍት ውስጥ የሂሳብ አያያዝ አብረን እንሰራለን፤ ሁሉም ተማሪዎች እንዲገኙ።',
        'image': 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=500',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildCommonAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
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
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('ተጨማሪ አንብብ (More)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF38BDF8))),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
