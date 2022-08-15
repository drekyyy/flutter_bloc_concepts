import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(title: 'Home screen', color: Colors.blue)),
        '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child:
                const SecondScreen(title: 'Second screen', color: Colors.red)),
        '/third': (context) => BlocProvider.value(
            value: _counterCubit,
            child:
                const ThirdScreen(title: 'Third screen', color: Colors.orange))
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
