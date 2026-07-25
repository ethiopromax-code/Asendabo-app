import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // አዳዲስ ፖስቶች ሁልጊዜ ከመጀመሪያው (ከላይ) እንዲታዩ የተደረጉበት ዝርዝር
    final List<Map<String, dynamic>> posts = [
      // 1. አዲስ የተደረገ ፖስት (ሁልጊዜ ከላይ እንዲሆን የሚደረግ)
      {
        'type': 'post',
        'name': 'አቤል ከበደ',
        'role': 'ICT - Level 3 ተማሪ',
        'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
        'title': 'የአሰንዳቦ ፖሊቴክኒክ ኮሌጅ አዲስ የمبادرة (Initiative) ስራ',
        'description': 'ተማሪዎች በፈጠራ ስራዎች ላይ ያላቸውን አቅም ለማሳደግ እና አዳዲስ ሶፍትዌሮችን ለማልማት የሚያስችል አዲስ የግሩፕ መድረክ ተፈጥሯል!',
        'image': 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=500',
      },
      // 2. ቀደም ሲል የነበሩ ፖስቶች ከታች ይከተላሉ
      {
        'type': 'post',
        'name': 'ኮሌጅ አስተዳደር (Admin)',
        'role': 'Asendabo Polytechnic College',
        'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
        'title': 'አዲስ የዲጂታል ላይብረሪ አገልግሎት ተጀመረ',
        'description': 'ተማሪዎች በየትኛውም ሰዓት ትምህርታዊ መጻሕፍትን እና የጥናት ማጣቀሻዎችን በኦንላይን ማግኘት እንዲችሉ አዲሱ የዲጂታል ላይብረሪ ሲስተም መጀመሩን እናሳውቃለን።',
        'image': 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=500',
      },
      {
        'type': 'post',
        'name': 'መ/ር አበበ (ICT Head)',
        'role': 'ICT Department',
        'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=100',
        'title': 'የኮምፒውተር ላብራቶሪ የጥገና እና ማሻሻያ መርሃ-ግብር',
        'description': 'ለሁሉም የደረጃ 3 እና 4 ተማሪዎች፦ በዋናው የICT ላብራቶሪ ውስጥ አዳዲስ አውታረ መረቦች (Networks) እና ሶፍትዌሮች የመትከል ስራ ነገ ይከናወናል።',
        'image': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildCommonAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // A. የአየር ሁኔታ ካርድ (ሁልጊዜ ከላይ በቋሚነት የሚቀመጥ)
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
                    mainAxisAlignment: MainAxisAlignment.between,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.cloud_outlined, color: Color(0xFF38BDF8), size: 28),
                          const SizedBox(width: 10),
                          const Text(
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
                    'በዚህ ሳምንት በአሰንዳቦ ፖሊቴክኒክ ኮሌጅ እና አካባቢው የሚኖረው የአየር ሁኔታ ለተማሪዎች እንቅስቃሴ እና ለተግባር ስልጠናዎች ምቹ ነው።',
                    style: TextStyle(fontSize: 12, color: Colors.grey[300], height: 1.3),
                  ),
                ],
              ),
            ),
          ),

          // B. አዳዲስ ፖስቶች (ከላይ እንዲጀምሩ የተደረጉ)
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
              )),
        ],
      ),
    );
  }
}
