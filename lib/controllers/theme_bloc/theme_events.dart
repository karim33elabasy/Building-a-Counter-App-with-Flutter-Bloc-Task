abstract class ThemeEvents{}

class ThemeChange extends ThemeEvents{
  final bool isDark;
  ThemeChange({required this.isDark});
}