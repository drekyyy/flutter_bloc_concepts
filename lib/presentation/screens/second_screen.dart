import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final MaterialColor color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'LESS THAN ZERO: ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 0) {
                  return Text(
                    'ZERO NOW, CLICK + OR -',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    'POSITIVE NUMBER: ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    backgroundColor: widget.color,
                    heroTag: null,
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
                    backgroundColor: widget.color,
                    heroTag: null,
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
