import 'dart:ui';

import 'package:flutter/material.dart';

import 'material_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme:  MaterialTheme.lightHighContrastScheme()
);