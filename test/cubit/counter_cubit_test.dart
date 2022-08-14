import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;

//initialize the necessary data test works with
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit!.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });
    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
      //function that returns current instance of counterCubit for testing purposes
      build: () => CounterCubit(),

      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
