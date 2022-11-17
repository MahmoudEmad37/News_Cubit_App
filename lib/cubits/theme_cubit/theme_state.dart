import 'package:flutter/material.dart';

abstract class ThemeState {
  late ThemeData themeData;
  ThemeState({required this.themeData});
}

class ThemeLight extends ThemeState {
  ThemeData themeData;
  ThemeLight({required this.themeData}) : super(themeData: themeData);
}
class ThemeDark extends ThemeState {
  ThemeData themeData;
  ThemeDark({required this.themeData}) : super(themeData: themeData);
}
