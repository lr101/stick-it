import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284496640),
      surfaceTint: Color(4286731539),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288375592),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283645735),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287131733),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209107),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280647820),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965492),
      onSurface: Color(4280359443),
      onSurfaceVariant: Color(4283187510),
      outline: Color(4285095249),
      outlineVariant: Color(4287002731),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806631),
      inversePrimary: Color(4294490993),
      primaryFixed: Color(4288375592),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286534160),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287131733),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285421630),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280647820),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216305),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293253324),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963685),
      surfaceContainer: Color(4294569184),
      surfaceContainerHigh: Color(4294174426),
      surfaceContainerHighest: Color(4293845204),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294490993),
      surfaceTint: Color(4294490993),
      onPrimary: Color(4282853888),
      primaryContainer: Color(4284825088),
      onPrimaryContainer: Color(4294958520),
      secondary: Color(4292854434),
      onSecondary: Color(4282330391),
      secondaryContainer: Color(4283908907),
      onSecondaryContainer: Color(4294761917),
      tertiary: Color(4286764000),
      onTertiary: Color(4278203965),
      tertiaryContainer: Color(4278210392),
      onTertiaryContainer: Color(4288606205),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279767564),
      onSurface: Color(4293845204),
      onSurfaceVariant: Color(4292134069),
      outline: Color(4288450176),
      outlineVariant: Color(4283450681),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845204),
      inversePrimary: Color(4286731539),
      primaryFixed: Color(4294958520),
      onPrimaryFixed: Color(4280948480),
      primaryFixedDim: Color(4294490993),
      onPrimaryFixedVariant: Color(4284825088),
      secondaryFixed: Color(4294761917),
      onSecondaryFixed: Color(4280817669),
      secondaryFixedDim: Color(4292854434),
      onSecondaryFixedVariant: Color(4283908907),
      tertiaryFixed: Color(4288606205),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4286764000),
      onTertiaryFixedVariant: Color(4278210392),
      surfaceDim: Color(4279767564),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359443),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069803),
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
