import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeChangerscreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer'), actions: [
        IconButton(
          icon: isDark
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          onPressed: () {
               ref.read(isDarkModeProvider.notifier).update((state) => !state);
          },
        )
      ]),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text(
            'Este Color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).update((state) => value!);
          },
        );
      },
    );
  }
}
