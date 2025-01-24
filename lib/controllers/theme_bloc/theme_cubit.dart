import 'package:create_different_blocs_task/controllers/theme_bloc/theme_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  bool _isDarkTheme = false;

  ThemeCubit() : super(InitialThemeState());

  bool get isDarkTheme => _isDarkTheme;

  void changeTheme({required bool isDark}){
  _isDarkTheme = isDark;
  emit(ThemeChangeState(isDark: isDarkTheme));
  }
}