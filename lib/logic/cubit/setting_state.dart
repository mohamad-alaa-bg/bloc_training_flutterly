part of 'setting_cubit.dart';

class SettingState extends Equatable {
  bool appNotification;
  final bool emailNotification;

  SettingState({
    @required this.appNotification,
    @required this.emailNotification,
  });

  SettingState copyWith({
    bool appNotification,
    bool emailNotification,
  }) {
    return SettingState(
        appNotification: appNotification ?? this.appNotification,
        emailNotification: emailNotification ?? this.emailNotification);
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        appNotification,
        emailNotification,
      ];
}
