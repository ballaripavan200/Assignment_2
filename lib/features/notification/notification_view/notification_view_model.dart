import 'package:flutter/material.dart';

class NotificationsViewModel extends ChangeNotifier {
  // Today's notifications
  final List<Map<String, dynamic>> todayNotifications = [
    {
      'profileImage': 'assets/Prof-1.png',
      'title': 'Emmett Perry',
      'description': 'Just messaged you. Check the message in the message tab.',
      'time': '10 mins ago',
    },
    {
      'profileImage': 'assets/Prof-2.png',
      'title': 'Geraldo',
      'description':
          'Just gave a 5-star review on your listing Fairview Apartment.',
      'time': '40 mins ago',
    },
    {
      'profileImage': 'assets/Prof-3.png',
      'title': 'Walter Lindsey',
      'description': 'Just bought your listing Schoolview House.',
      'time': '4 hours ago',
    },
  ];

  // Older notifications
  final List<Map<String, dynamic>> olderNotifications = [
    {
      'profileImage': 'assets/Profile4.png',
      'title': 'Volma Cole',
      'description': 'Just favorited your listing Schoolview House.',
      'time': '1 day ago',
    },
  ];
}
