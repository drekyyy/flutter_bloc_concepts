import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit()
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));

  void toggleAppNotifications(bool newValue) {
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotifications(bool newValue) {
    emit(state.copyWith(emailNotifications: newValue));
  }

  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  // called for every state emitted by CounterCubit
  Map<String, dynamic>? toJson(SettingsState state) {
    //addError(Exception('Couldnt write to storage!'), StackTrace.current);
    return state.toMap();
  }
}
