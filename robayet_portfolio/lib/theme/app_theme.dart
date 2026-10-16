import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared colors and gradient accents used across the site.
class AppColors {
  static const bg = Color(0xFF080716);
  static const surface = Color(0xFF100E20);
  static const surface2 = Color(0xFF171529);
  static const border = Color(0xFF2A263F);
  static const text = Color(0xFFF5F2FF);
  static const muted = Color(0xFFA5A3B9);
  static const accent = Color(0xFF22D3E6);
  static const violet = Color(0xFFAC35E8);
  static const pink = Color(0xFFEB2787);
  static const success = Color(0xFF19C991);

  static const accentGradient = LinearGradient(
    colors: [violet, pink, accent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

bool isMobile(BuildContext c) => MediaQuery.sizeOf(c).width < 760;

/// Width for each card in a wrapping grid. Columns adapt to the space available.
double gridItemWidth(double maxW,
    {int maxCols = 3, double gap = 20, double minItem = 300}) {
  final cols = ((maxW + gap) / (minItem + gap)).floor().clamp(1, maxCols);
  return (maxW - gap * (cols - 1)) / cols;
}

class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme)
          .apply(bodyColor: AppColors.text, displayColor: AppColors.text),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.bg,
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.text,
          side: const BorderSide(color: AppColors.border),
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
