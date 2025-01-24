import 'package:create_different_blocs_task/controllers/theme_bloc/theme_events.dart';
import 'package:create_different_blocs_task/controllers/theme_bloc/theme_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvents,ThemeStates> {
  bool isDarkTheme = false;

  ThemeBloc() : super(InitialThemeState()){
    on<ThemeEvents>((event,state){
      if(event is ThemeChange){
        isDarkTheme = event.isDark;
        emit(ThemeChangeState(isDark: isDarkTheme));
      }
    });
  }

}