// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;
  SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  List<Object> get props => [
        emailNotifications,
        appNotifications,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appNotifications': appNotifications,
      'emailNotifications': emailNotifications,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotifications: map['appNotifications'] as bool,
      emailNotifications: map['emailNotifications'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) =>
      SettingsState.fromMap(json.decode(source) as Map<String, dynamic>);
}
