import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF944900),
      surfaceTint: Color(4287058459),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284888832),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(0xFF753900),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283776554),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200355),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209603),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965493),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(0xFF653303),
      outline: Color(4283252791),
      outlineVariant: Color(4283252791),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806632),
      inversePrimary: Color(4294961367),
      primaryFixed: Color(4284888832),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(-9554176),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283776554),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(-8170194),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209603),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203181),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293318605),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963688),
      surfaceContainer: Color(4294700001),
      surfaceContainerHigh: Color(4294305243),
      surfaceContainerHighest: Color(4293910741),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948984),
      surfaceTint: Color(4294948984),
      onPrimary: Color(4283115264),
      primaryContainer: Color(4285217539),
      onPrimaryContainer: Color(4294958272),
      secondary: Color(4293050533),
      onSecondary: Color(4282461209),
      secondaryContainer: Color(4284105261),
      onSecondaryContainer: Color(4294958272),
      tertiary: Color(4286764487),
      onTertiary: Color(4278204209),
      tertiaryContainer: Color(4278210631),
      onTertiaryContainer: Color(4288606947),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(0xFF000000),
      onSurface: Color(4293910741),
      onSurfaceVariant: Color(4292264886),
      outline: Color(4288581250),
      outlineVariant: Color(4283515962),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293910741),
      inversePrimary: Color(4287058459),
      primaryFixed: Color(4294958272),
      onPrimaryFixed: Color(4281210368),
      primaryFixedDim: Color(4294948984),
      onPrimaryFixedVariant: Color(4285217539),
      secondaryFixed: Color(4294958272),
      onSecondaryFixed: Color(4280882950),
      secondaryFixedDim: Color(4293050533),
      onSecondaryFixedVariant: Color(4284105261),
      tertiaryFixed: Color(4288606947),
      onTertiaryFixed: Color(4278198300),
      tertiaryFixedDim: Color(4286764487),
      onTertiaryFixedVariant: Color(4278210631),
      surfaceDim: Color(4279833100),
      surfaceBright: Color(4282464048),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280424980),
      surfaceContainer: Color(4280688152),
      surfaceContainerHigh: Color(4281411618),
      surfaceContainerHighest: Color(4282135340),
    );
  }

  ThemeData dark() {
    return theme(darkHighContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948984),
      surfaceTint: Color(4294948984),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294950275),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966008),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293379241),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293656570),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287093451),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279833100),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966008),
      outline: Color(4292528058),
      outlineVariant: Color(4292528058),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293910741),
      inversePrimary: Color(4282524160),
      primaryFixed: Color(4294959563),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294950275),
      onPrimaryFixedVariant: Color(4280684800),
      secondaryFixed: Color(4294959563),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293379241),
      onSecondaryFixedVariant: Color(4280488451),
      tertiaryFixed: Color(4288935655),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287093451),
      onTertiaryFixedVariant: Color(4278196759),
      surfaceDim: Color(4279833100),
      surfaceBright: Color(4282464048),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280424980),
      surfaceContainer: Color(4280688152),
      surfaceContainerHigh: Color(4281411618),
      surfaceContainerHighest: Color(4282135340),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
