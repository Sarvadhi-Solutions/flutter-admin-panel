part of 'theme_mode_bloc.dart';

@freezed
class ThemeModeState with _$ThemeModeState {
  const factory ThemeModeState.initial() = _Initial;
  const factory ThemeModeState.success(bool themeMode) = _Success;
}
