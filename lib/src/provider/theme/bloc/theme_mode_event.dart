part of 'theme_mode_bloc.dart';

@freezed
class ThemeModeEvent with _$ThemeModeEvent {
  const factory ThemeModeEvent.changeTheme(bool? themeMode) = _ChangeTheme;
}