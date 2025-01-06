# assignment2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




==================================Documentation==================================

1.Splash Screen
    -Initial entry point of the app.
2.Home Screen
    -Displays featured real estate listings.
    -Search bar for filtering properties.
3.Profile Screen
    -Manage user details and preferences.
4.Search Screen
    -Dedicated interface for searching properties.
5.Notifications & Messages
    -Tabbed interface for notifications and messages.

=================================folder structure=================================

```
└── 📁assets
    └── Build-1.png
    └── Build-2.png
    └── Build-3.png
    └── Build-4.png
    └── Location.png
    └── Logo.png
    └── Mic.png
    └── Notification.png
    └── Prof-1.png
    └── Prof-2.png
    └── Prof-3.png
    └── Prof-4.png
    └── Prof.png
    └── Search.png
```
```
└── 📁lib
    └── 📁features
        └── 📁favourate
            └── 📁view
            └── 📁view_model
                └── favourate_view_model.dart
                └── favourate_view.dart
        └── 📁home
            └── 📁home_view
                └── home_view.dart
            └── 📁home_viewmodel
                └── home_view_model.dart
        └── 📁messages
            └── 📁model
                └── messages_view.dart
        └── 📁notification
        └── 📁notification_and_messages
            └── 📁view
                └── notification_message_tabs.dart
            └── 📁model
                └── notification_view.dart
            └── 📁notification_view
                └── notification_view_model.dart
        └── 📁profile
            └── 📁view
            └── 📁view_model
                └── profile_view_model.dart
                └── profile_view.dart
        └── 📁search
            └── 📁view
            └── 📁view_model
                └── search_view_model.dart
                └── search_view.dart
        └── 📁splash
            └── 📁view
            └── 📁view_model
                └── splash_view_model.dart
                └── splash_screen.dart
    └── 📁routers
        └── routes_const.dart
        └── routes.dart
    └── 📁services
        └── navigation_serv.dart
    └── 📁utils
        └── color_const.dart
        └── images_const.dart
    └── 📁widgets
        └── 📁button
            └── button_w.dart
        └── 📁card
            └── estate_details_card.dart
        └── 📁estate
        └── estate_model.dart
            └── estatecard.dart
        └── 📁input_text_field
            └── input_text_w.dart
        └── 📁logo
            └── logo_w.dart
        └── 📁profile
            └── Profilestat.dart
        └── 📁tabbar
            └── custom_taskbar.dart
    └── main.dart
```