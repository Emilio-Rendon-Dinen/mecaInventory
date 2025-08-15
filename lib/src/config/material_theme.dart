import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff005dac),
      surfaceTint: Color(0xff005faf),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1976d2),
      onPrimaryContainer: Color(0xfffffdff),
      secondary: Color(0xffb02f00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffff5722),
      onSecondaryContainer: Color(0xff541200),
      tertiary: Color(0xff494949),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff616161),
      onTertiaryContainer: Color(0xffdedcdc),
      error: Color(0xffa70000),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffd50000),
      onErrorContainer: Color(0xffffe4e0),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffa5c8ff),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001c3a),
      primaryFixedDim: Color(0xffa5c8ff),
      onPrimaryFixedVariant: Color(0xff004786),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff3b0900),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff862200),
      tertiaryFixed: Color(0xffe4e2e2),
      onTertiaryFixed: Color(0xff1b1c1c),
      tertiaryFixedDim: Color(0xffc7c6c6),
      onTertiaryFixedVariant: Color(0xff464747),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003669),
      surfaceTint: Color(0xff005faf),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff006ec9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff691800),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffca3700),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff363636),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff616161),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740000),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffd50000),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff333738),
      outline: Color(0xff4f5354),
      outlineVariant: Color(0xff6a6e6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffa5c8ff),
      primaryFixed: Color(0xff006ec9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00559e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffca3700),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff9f2a00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6d6d6d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff555555),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffdfdcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002c57),
      surfaceTint: Color(0xff005faf),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004a8a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff581300),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8b2300),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2c2c2c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff494949),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600000),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff980000),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292d2d),
      outlineVariant: Color(0xff464a4a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffa5c8ff),
      primaryFixed: Color(0xff004a8a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003363),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8b2300),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff631600),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff494949),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff323333),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa5c8ff),
      surfaceTint: Color(0xffa5c8ff),
      onPrimary: Color(0xff00315f),
      primaryContainer: Color(0xff1976d2),
      onPrimaryContainer: Color(0xfffffdff),
      secondary: Color(0xffffb5a0),
      onSecondary: Color(0xff5f1500),
      secondaryContainer: Color(0xffff5722),
      onSecondaryContainer: Color(0xff541200),
      tertiary: Color(0xffc7c6c6),
      onTertiary: Color(0xff303031),
      tertiaryContainer: Color(0xff616161),
      onTertiaryContainer: Color(0xffdedcdc),
      error: Color(0xffffb4a8),
      onError: Color(0xff690000),
      errorContainer: Color(0xffd50000),
      onErrorContainer: Color(0xffffe4e0),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff005faf),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001c3a),
      primaryFixedDim: Color(0xffa5c8ff),
      onPrimaryFixedVariant: Color(0xff004786),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff3b0900),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff862200),
      tertiaryFixed: Color(0xffe4e2e2),
      onTertiaryFixed: Color(0xff1b1c1c),
      tertiaryFixedDim: Color(0xffc7c6c6),
      onTertiaryFixedVariant: Color(0xff464747),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcaddff),
      surfaceTint: Color(0xffa5c8ff),
      onPrimary: Color(0xff00264c),
      primaryContainer: Color(0xff4492f0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd2c6),
      onSecondary: Color(0xff4c0f00),
      secondaryContainer: Color(0xffff5722),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdddcdc),
      onTertiary: Color(0xff252626),
      tertiaryContainer: Color(0xff919090),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cb),
      onError: Color(0xff540000),
      errorContainer: Color(0xffff5540),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdadddd),
      outline: Color(0xffafb2b3),
      outlineVariant: Color(0xff8d9191),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff004888),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001128),
      primaryFixedDim: Color(0xffa5c8ff),
      onPrimaryFixedVariant: Color(0xff003669),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff280500),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff691800),
      tertiaryFixed: Color(0xffe4e2e2),
      onTertiaryFixed: Color(0xff101111),
      tertiaryFixedDim: Color(0xffc7c6c6),
      onTertiaryFixedVariant: Color(0xff363636),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff070707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3e3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeaf0ff),
      surfaceTint: Color(0xffa5c8ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9fc4ff),
      onPrimaryContainer: Color(0xff000b1e),
      secondary: Color(0xffffece7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffaf98),
      onSecondaryContainer: Color(0xff1e0300),
      tertiary: Color(0xfff1efef),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc3c2c2),
      onTertiaryContainer: Color(0xff0a0b0c),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea1),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeef0f1),
      outlineVariant: Color(0xffc0c3c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff004888),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa5c8ff),
      onPrimaryFixedVariant: Color(0xff001128),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff280500),
      tertiaryFixed: Color(0xffe4e2e2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc7c6c6),
      onTertiaryFixedVariant: Color(0xff101111),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff484646),
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
     scaffoldBackgroundColor: colorScheme.background,
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
