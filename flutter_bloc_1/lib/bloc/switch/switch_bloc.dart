import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_1/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableorDisableNotification>(
      (event, emit) {
        emit(state.copyWith(isSwitch: !state.isSwitch));
      },
    );
    on<SliderEvent>((event, emit) {
      emit(state.copyWith(slider: event.value));
    });
  }
}
