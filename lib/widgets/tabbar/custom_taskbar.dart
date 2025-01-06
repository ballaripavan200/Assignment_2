import 'package:flutter/material.dart';

class CustomTaskbar extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabViews;

  const CustomTaskbar({
    super.key,
    required this.tabs,
    required this.tabViews,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(children: tabViews),
          ),
        ],
      ),
    );
  }
}
