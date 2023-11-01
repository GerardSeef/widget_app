import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

//Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple valor booleano
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Un objeto de tipo AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado = Nueva instancia de AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void setSelectedColor(int selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }
}
