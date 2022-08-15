import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
 
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                title: 'Home screen', color: Colors.blue));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: 'Second screen', color: Colors.red));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'Third screen', color: Colors.pink));

      default:
        return null;
    }
  }

  @override
  
}
