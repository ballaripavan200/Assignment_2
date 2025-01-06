import 'package:assignment2/features/home/home_view/home_view.dart';
import 'package:assignment2/features/notification/model/notification_view.dart';
import 'package:assignment2/features/notification/notification_view/notification_view_model.dart';
import 'package:assignment2/features/notification_and_messages/view/notification_message_tabs.dart';
import 'package:assignment2/features/profile/view/profile_view.dart';
import 'package:assignment2/features/search/view/search_view.dart';
import 'package:assignment2/features/search/view_model/search_view_model.dart';
import 'package:assignment2/routers/routes_const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:assignment2/features/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: RoutesConst.profileScreen,
        builder: (context, state) => ProfileView(),
      ),
      GoRoute(
        path: RoutesConst.searchScreen,
        builder: (context, state) => SearchView(),
      ),
      GoRoute(
        path: RoutesConst.notificationsScreen,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => NotificationsViewModel(),
          child: NotificationsView(),
        ),
      ),
      GoRoute(
        path: RoutesConst.notificationMessagesScreen, // Add route
        builder: (context, state) => NotificationMessageTabs(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Error: Page not found!')),
    ),
  );
}