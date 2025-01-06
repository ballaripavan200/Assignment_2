import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'All chats',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildChatItem(
            profileImage: 'assets/Profile1.png',
            name: 'Milano',
            lastMessage: 'Tempor incididunt ut labore et dolore',
            time: '10:45',
            isOnline: true,
          ),
          _buildChatItem(
            profileImage: 'assets/Profile2.png',
            name: 'Samuel Ella',
            lastMessage: 'Lorem ipsum dolor sit amet',
            time: '12:00',
            isOnline: false,
          ),
          _buildChatItem(
            profileImage: 'assets/Profile3.png',
            name: 'Emmett Perry',
            lastMessage: 'Excepteur sint occaecat cupidatat non',
            time: '12:50',
            isOnline: false,
          ),
          _buildChatItem(
            profileImage: 'assets/Profile4.png',
            name: 'Walter Lindsey',
            lastMessage: 'Quis nostrud exercitation ullamco',
            time: '1 Day ago',
            isOnline: false,
          ),
          _buildChatItem(
            profileImage: 'assets/Profile5.png',
            name: 'Velma Cole',
            lastMessage: 'Excepteur sint occaecat cupidatat non',
            time: '2 Days ago',
            isOnline: false,
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem({
    required String profileImage,
    required String name,
    required String lastMessage,
    required String time,
    required bool isOnline,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: 24,
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
