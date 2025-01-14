import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFE88F1D),
      surfaceTint: Color(0xFFE88F1D),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xFFC07200),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff533f27),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff887055),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004a53),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff25808c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      onSurfaceVariant: Color(0xff4c4136),
      outline: Color(0xff695d51),
      outlineVariant: Color(0xff86786b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xfff8bb71),
      primaryFixed: Color(0xFFB67212),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7f5210),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff887055),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6e583e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff25808c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006671),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e5),
      surfaceContainer: Color(0xfff9ece0),
      surfaceContainerHigh: Color(0xfff3e6da),
      surfaceContainerHighest: Color(0xffeee0d4),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff8bb71),
      surfaceTint: Color(0xfff8bb71),
      onPrimary: Color(0xff472a00),
      primaryContainer: Color(0xff653e00),
      onPrimaryContainer: Color(0xffffddb8),
      secondary: Color(0xffdfc2a2),
      onSecondary: Color(0xff3f2d17),
      secondaryContainer: Color(0xff57432b),
      onSecondaryContainer: Color(0xfffcddbd),
      tertiary: Color(0xff82d3e0),
      onTertiary: Color(0xff00363d),
      tertiaryContainer: Color(0xff004f58),
      onTertiaryContainer: Color(0xff9eeffd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff18120c),
      onSurface: Color(0xffeee0d4),
      onSurfaceVariant: Color(0xffd4c4b5),
      outline: Color(0xff9c8e80),
      outlineVariant: Color(0xff504539),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d4),
      inversePrimary: Color(0xff825513),
      primaryFixed: Color(0xffffddb8),
      onPrimaryFixed: Color(0xff2a1700),
      primaryFixedDim: Color(0xfff8bb71),
      onPrimaryFixedVariant: Color(0xff653e00),
      secondaryFixed: Color(0xfffcddbd),
      onSecondaryFixed: Color(0xff281805),
      secondaryFixedDim: Color(0xffdfc2a2),
      onSecondaryFixedVariant: Color(0xff57432b),
      tertiaryFixed: Color(0xff9eeffd),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xff82d3e0),
      onTertiaryFixedVariant: Color(0xff004f58),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData light() {
    return theme(lightMediumContrastScheme());
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
