import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(SettingState(
          appNotification: false,
          emailNotification: false,
        ));

  void toggleAppNotification(bool newValue) {
    
    
    emit(state.copyWith(appNotification: newValue));
  }

  void toggleEmailNotification(bool newValue) {
    emit(state.copyWith(emailNotification: newValue));
  }
}
