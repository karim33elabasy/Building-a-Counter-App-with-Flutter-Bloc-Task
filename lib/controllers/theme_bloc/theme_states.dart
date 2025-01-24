abstract class ThemeStates{
  const ThemeStates();
}
class InitialThemeState extends ThemeStates{}

class ThemeChangeState extends ThemeStates{
  final bool isDark;
  const ThemeChangeState({required this.isDark});
}