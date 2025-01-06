import 'package:assignment2/features/messages/model/messages_view.dart';
import 'package:assignment2/features/notification/model/notification_view.dart';
import 'package:assignment2/features/notification/notification_view/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationMessageTabs extends StatefulWidget {
  @override
  _NotificationMessageTabsState createState() =>
      _NotificationMessageTabsState();
}

class _NotificationMessageTabsState extends State<NotificationMessageTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 50), // Adjust height for TabBar
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: AppBar(
          title: const Text(''),
          backgroundColor: Colors.white,
          elevation: 2,
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            tabs: const [
              Tab(text: 'Notifications'),
              Tab(text: 'Messages'),
            ],
          ),
        ),
      ),
    ),
    body: TabBarView(
      controller: _tabController,
      children: [
        ChangeNotifierProvider(
          create: (_) => NotificationsViewModel(),
          child: NotificationsView(),
        ),
        MessagesView(), // Replace with your MessagesView widget
      ],
    ),
  );
}
    }