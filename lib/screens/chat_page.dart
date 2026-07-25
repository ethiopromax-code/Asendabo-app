import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String _selectedDepartment = 'ICT';
  
  final List<String> _departments = [
    'ICT',
    'Building Electrical Installation',
    'Accounting', 
    'Agriculture', 
    'Construction', 
  ];

  // ለ ICT የተለዩ 2 ንዑስ ምርጫዎች (Sub-departments)
  final List<String> _ictSubCategories = [
    'Hardware & Networking System',
    'Database'
  ];
  String _selectedIctSub = 'Hardware & Networking System';

  // የደረጃዎች ዝርዝር (Levels)
  final List<String> _levels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildCommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ዋናዎቹ ዲፓርትመንቶች መምረጫ
            const Text(
              'የኮሌጁ ክፍሎች (Departments)',
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _departments.length,
                itemBuilder: (context, index) {
                  final dept = _departments[index];
                  final isSelected = _selectedDepartment == dept;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(dept),
                      selected: isSelected,
                      selectedColor: const Color(0xFF0C62B6),
                      backgroundColor: const Color(0xFF1E1E1E),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          _selectedDepartment = dept;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: isSelected ? const Color(0xFF0C62B6) : Colors.grey[800]!),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // 2. ICT ከተመረጠ ብቻ የሚመጡት 2 ንዑስ አማራጮች (Hardware & Networking / Database)
            if (_selectedDepartment == 'ICT') ...[
              const SizedBox(height: 12),
              const Text(
                'የ ICT ንዑስ ዘርፎች (Sub-categories)',
                style: TextStyle(color: Color(0xFF38BDF8), fontSize: 13, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _ictSubCategories.length,
                  itemBuilder: (context, index) {
                    final sub = _ictSubCategories[index];
                    final isSelected = _selectedIctSub == sub;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(sub),
                        selected: isSelected,
                        selectedColor: const Color(0xFF38BDF8),
                        backgroundColor: const Color(0xFF1E1E1E),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                        onSelected: (selected) {
                          setState(() {
                            _selectedIctSub = sub;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],

            const SizedBox(height: 16),
            Text(
              _selectedDepartment == 'ICT' 
                  ? '$_selectedDepartment - $_selectedIctSub (Levels)'
                  : '$_selectedDepartment - የደረጃ ዝርዝር',
              style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 3. የደረጃዎች ዝርዝር (Level 1 - Level 4)
            Expanded(
              child: ListView.builder(
                itemCount: _levels.length,
                itemBuilder: (context, index) {
                  final level = _levels[index];
                  String titleText = _selectedDepartment == 'ICT' 
                      ? '$_selectedIctSub $level' 
                      : '$_selectedDepartment $level';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    color: const Color(0xFF1E1E1E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF0C62B6),
                        child: Icon(Icons.chat, color: Colors.white, size: 18),
                      ),
                      title: Text(titleText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: Text('የውይይት ግሩፕ ለ $level ተማሪዎች', style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                      onTap: () {
                        // ወደ እውነተኛው የቴሌግራም ዓይነት የቻት ማስተናገጃ ገጽ መግቢያ
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroupChatScreen(groupName: titleText),
                          ),
                        );
                      },
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
}

// ==========================================
// 📱 የቴሌግራም ዓይነት የቻት እና የመልዕክት መጻፊያ ገጽ (Group Chat Screen)
// ==========================================
class GroupChatScreen extends StatefulWidget {
  final String groupName;
  const GroupChatScreen({super.key, required this.groupName});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  
  // የናሙና ቻት መልዕክቶች (ከፕሮፋይል ፎቶ እና ስም ጋር)
  final List<Map<String, String>> _messages = [
    {
      'name': 'አበበ ከበደ',
      'message': 'ሰላም ለዚህ ግሩፕ ቤተሰቦች! የዛሬውንAssignment አሰራር አብረን እንየው።',
      'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100'
    },
    {
      'name': 'መአዛ ታደሰ',
      'message': 'አዎ በእርግጥ! መምህሩ የሰጡንን ንድፍ (Diagram) እየሰራሁ ነው።',
      'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100'
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'name': 'እኔ (Student)',
        'message': _messageController.text.trim(),
        'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=100'
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Text(widget.groupName, style: const TextStyle(fontSize: 15, color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // መልዕክቶች የሚታዩበት ሊስት (ListView)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // የላኪው የፕሮፋይል ፎቶ
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(msg['avatar']!),
                      ),
                      const SizedBox(width: 10),
                      // ስም እና የጻፈው መልዕክት
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg['name']!,
                              style: const TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                msg['message']!,
                                style: const TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ታች ላይ የሚገኘው የመልዕክት መጻፊያ ፊልድ (Message Input Field)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: const Color(0xFF1E1E1E),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'መልዕክት ይጻፉ...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF38BDF8)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
