part of 'stepper_bloc.dart';

@freezed
class StepperState with _$StepperState {
  const factory StepperState.initial() = _Initial;
  const factory StepperState.success(int index) = _Success;
}
