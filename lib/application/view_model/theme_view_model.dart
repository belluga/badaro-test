import 'package:badaro_test/application/view_model/enum/theme_skins.dart';
import 'package:flutter/material.dart';
import 'package:stream_value/core/stream_value.dart';

class ThemeViewModel {
  late StreamValue<ThemeData> themeDataStreamValue;

  ThemeViewModel() {
    themeDataStreamValue = StreamValue<ThemeData>(defaultValue: defaultTheme);
  }

  ThemeData get theme => themeDataStreamValue.value;

  ThemeData get defaultTheme => ThemeData(
        primaryColor: const Color.fromRGBO(255, 31, 109, 1),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(255, 31, 109, 1),
          onPrimary: Color.fromRGBO(255, 255, 255, 1),
          secondary: Color.fromRGBO(0, 0, 0, 1),
          onSecondary: Color.fromRGBO(255, 255, 255, 1),
          background: Color.fromRGBO(245, 245, 245, 1),
          onBackground: Color.fromRGBO(0, 0, 0, 1),
          surface: Color.fromRGBO(255, 255, 255, 1),
          onSurface: Color.fromRGBO(0, 0, 0, 1),
          error: Color.fromRGBO(255, 0, 0, 1),
          onError: Color.fromRGBO(255, 255, 255, 1),
        ),
      );

  void switchTheme(ThemeSkins skin) {
    switch (skin) {
      case ThemeSkins.orange:
        themeDataStreamValue.addValue(ThemeData(
          primaryColor: const Color.fromRGBO(244, 117, 0, 1),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromRGBO(244, 117, 0, 1),
            onPrimary: Color.fromRGBO(255, 255, 255, 1),
            secondary: Color.fromRGBO(0, 0, 0, 1),
            onSecondary: Color.fromRGBO(255, 255, 255, 1),
            background: Color.fromRGBO(245, 245, 245, 1),
            onBackground: Color.fromRGBO(0, 0, 0, 1),
            surface: Color.fromRGBO(255, 255, 255, 1),
            onSurface: Color.fromRGBO(0, 0, 0, 1),
            error: Color.fromRGBO(255, 0, 0, 1),
            onError: Color.fromRGBO(255, 255, 255, 1),
          ),
        ));
      case ThemeSkins.main:
      default:
        themeDataStreamValue.addValue(defaultTheme);
    }
  }
}
