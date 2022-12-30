part of 'stepper_bloc.dart';

@freezed
class StepperEvent with _$StepperEvent {
  const factory StepperEvent.changeIndex(int index) = _ChangeIndex;
}