import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../constants/enums.dart';
import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  // these 2 methods are pillar of storing and saving the state to the storage while also being able to retrieve it back when the app is rebooted
  //fromJson called every time the app needs stored data
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  // called for every state emitted by CounterCubit
  Map<String, dynamic>? toJson(CounterState state) {
    //addError(Exception('Couldnt write to storage!'), StackTrace.current);
    return state.toMap();
  }

  @override
  void onChange(Change<CounterState> change) {
    // print(
    //     'current state: ${change.currentState.counterValue.toString()},  next state: ${change.nextState.counterValue.toString()}');
    print(change);
    super.onChange(change);
  }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print('$error, $stackTrace');
  //   super.onError(error, stackTrace);
  // }
}
