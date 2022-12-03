import 'package:flutter/material.dart';
import 'package:multi_theme_support_demo/theme_settings.dart';

class ThemeSelectScreen extends StatefulWidget {
  const ThemeSelectScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSelectScreen> createState() => _ThemeSelectScreenState();
}

class _ThemeSelectScreenState extends State<ThemeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme selection'),
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ThemeMode.values.length,
          padding: const EdgeInsets.all(18),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            ThemeMode mode = ThemeMode.values[index];
            return RadioListTile<ThemeMode>(
              title: Text(mode.name),
              value: mode,
              groupValue: ThemeSettings().myThemeMode,
              onChanged: (ThemeMode? value) {
                ThemeSettings().setMyThemeMode(value ?? ThemeMode.system, update: true);
                setState((){});
              },
            );
          },
        ),
      ),
    );
  }
}
