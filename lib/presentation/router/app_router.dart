import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: 'Home screen', color: Colors.blue));
      case '/second':
        return MaterialPageRoute(
            builder: (_) =>
                const SecondScreen(title: 'Second screen', color: Colors.red));
      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                const ThirdScreen(title: 'Third screen', color: Colors.pink));
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());

      default:
        return null;
    }
  }
}
