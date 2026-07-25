import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF0C62B6),
                child: Icon(Icons.group, color: Colors.white),
              ),
              title: Text('ICT Level III Group', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text('ተማሪዎች እና አስተማሪዎች የሚወያዩበት...', style: TextStyle(color: Colors.grey)),
              trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.school, color: Colors.white),
              ),
              title: Text('General College Discussion', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text('አጠቃላይ ውይይት...', style: TextStyle(color: Colors.grey)),
              trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
