import 'package:admin_dash/src/utils/hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';
part 'theme_mode_bloc.freezed.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(const _Initial()) {
    on<ThemeModeEvent>((event, emit) async {
      if (event.themeMode == null) {
        if (HiveUtils.isContainKey(HiveKeys.themeMode)) {
          emit(_Success(await HiveUtils.get(HiveKeys.themeMode)));
        } else {
          emit(const _Success(false));
        }
      } else {
        emit(_Success(event.themeMode!));
      }
    });
  }
}

final ThemeModeBloc themeModeBloc = ThemeModeBloc();
