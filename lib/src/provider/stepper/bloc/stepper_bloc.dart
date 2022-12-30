import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_event.dart';
part 'stepper_state.dart';
part 'stepper_bloc.freezed.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc() : super(const _Initial()) {
    on<StepperEvent>((event, emit) {
      emit(const _Initial());
      emit(_Success(event.index));
    });
  }
}
