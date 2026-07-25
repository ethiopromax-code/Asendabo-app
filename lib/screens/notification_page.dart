import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // የናሙና ማሳወቂያዎች ዝርዝር
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'አዲስ የክፍል መደብ ማስታወቂያ',
        'poster': 'ኮሌጅ አስተዳደር (Admin)',
        'time': 'ከ 1 ሰዓት በፊት',
        'description': 'ለሁሉም የደረጃ 3 እና 4 ተማሪዎች፦ የናሙና ፈተና መርሃ-ግብር ከነገ ጀምሮ በኖቲፊኬሽን ሰሌዳ ላይ ይለጠፋል።',
        'icon': Icons.campaign,
        'color': const Color(0xFF38BDF8),
        'isNew': true,
      },
      {
        'title': 'የ ICT ሕንፃ ኤሌክትሪክ ዝርጋታ ስልጠና',
        'poster': 'መ/ር አበበ (Department Head)',
        'time': 'ከ 3 ሰዓት በፊት',
        'description': 'በቀጣይ ሳምንት የሚደረገውን የተግባር (Practical) ስልጠና በተመለከተ ሁሉም ተማሪዎች በላብራቶሪ ክፍል እንዲገኙ።',
        'icon': Icons.electric_bolt,
        'color': Colors.orangeAccent,
        'isNew': true,
      },
      {
        'title': 'አዲስ ፖስት በ መነሻ (Home) ገጽ ላይ ታክሏል',
        'poster': 'ዩናይትድ ናሽንስ (SDGs)',
        'time': 'ትናንት',
        'description': 'የተባበሩት መንግስታት ድርጅት ያስተዋወቃቸው 17ቱ ዓለም አቀፍ የዘላቂ ልማት ግቦች (SDGs) መረጃዎች ተጭነዋል።',
        'icon': Icons.public,
        'color': Colors.greenAccent,
        'isNew': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildCommonAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: item['isNew'] 
                  ? const BorderSide(color: Color(0xFF0C62B6), width: 1.2) 
                  : BorderSide.none,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // ከማሳወቂያዎች ውስጥ አንዱን ሲጫኑ የዝርዝር ማሳያ አሳንሶ ወደ መነሻ ገጽ (ወይም የዝርዝር መረጃው) ይወስዳል
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFF1E1E1E),
                    title: Text(item['title'], style: const TextStyle(color: Colors.white, fontSize: 16)),
                    content: Text(
                      '${item['description']}\n\nየለጠፈው: ${item['poster']}',
                      style: TextStyle(color: Colors.grey[300], fontSize: 13),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // ፖፕአፑን ዝጋ
                          // ወደ መነሻ ገጽ (Home Page) በ MainNavigationScreen በኩል ለመመለስ
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainNavigationScreen(),
                            ),
                          );
                        },
                        child: const Text('ወደ መነሻ ገጽ ሄድ (Home)', style: TextStyle(color: Color(0xFF38BDF8))),
                      ),
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: item['color'].withOpacity(0.2),
                          child: Icon(item['icon'], color: item['color'], size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'የለጠፈው፦ ${item['poster']}',
                                style: const TextStyle(
                                  color: Color(0xFF38BDF8),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (item['isNew'])
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0C62B6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'አዲስ',
                              style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['description'],
                      style: TextStyle(color: Colors.grey[300], fontSize: 12, height: 1.3),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item['time'],
                        style: TextStyle(color: Colors.grey[500], fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
