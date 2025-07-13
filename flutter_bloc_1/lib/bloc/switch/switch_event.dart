import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class EnableorDisableNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double value;

  const SliderEvent(this.value);

  @override
  List<Object?> get props => [value];
}
