// カスタムカラーパレット
import 'package:flutter/material.dart';

class AppColors {
  static const int _bluePrimaryValue = 0xFF2563EB;
  static const MaterialColor blue =
      MaterialColor(_bluePrimaryValue, <int, Color>{
        50: Color(0xFFEFF6FF),
        100: Color(0xFFDBEAFE),
        200: Color(0xFFBFDBFE),
        300: Color(0xFF93C5FD),
        400: Color(0xFF60A5FA),
        500: Color(_bluePrimaryValue),
        600: Color(0xFF2563EB),
        700: Color(0xFF1D4ED8),
        800: Color(0xFF1E40AF),
        900: Color(0xFF1E3A8A),
      });

  static const int _navyPrimaryValue = 0xFF0284C7;
  static const MaterialColor navy =
      MaterialColor(_navyPrimaryValue, <int, Color>{
        50: Color(0xFFE0F2FE),
        100: Color(0xFFBAE6FD),
        200: Color(0xFF7DD3FC),
        300: Color(0xFF38BDF8),
        400: Color(0xFF0EA5E9),
        500: Color(_navyPrimaryValue),
        600: Color(0xFF0369A1),
        700: Color(0xFF075985),
        800: Color(0xFF0C4A6E),
        900: Color(0xFF082F49),
      });

  static const Color steelLight = Color(0xFFF1F5F9);
  static const Color steel = Color(0xFF475569);
  static const Color steelDark = Color(0xFF0F172A);

  static const Color azureLight = Color(0xFFE0F7FF);
  static const Color azure = Color(0xFF38BDF8);
  static const Color azureDark = Color(0xFF0369A1);

  static const Color slateLight = Color(0xFFF8FAFC);
  static const Color slate = Color(0xFF64748B);
  static const Color slateDark = Color(0xFF1E293B);
}

// テーマ設定
class AppTheme {
  static ThemeData get light {
    final cs = ColorScheme.light(
      primary: AppColors.blue,
      onPrimary: Colors.white,
      secondary: AppColors.navy,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.slate,
      error: Color(0xFFF87171), // destructive系の色に合わせる
      onError: Colors.white,
    );
    return ThemeData(
      colorScheme: cs,
      // primarySwatch を削除し、colorScheme を優先
      scaffoldBackgroundColor: cs.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.surface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cs.primary,
        selectedItemColor: cs.onPrimary,
        unselectedItemColor: cs.onPrimary.withValues(alpha: 0.7),
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: AppColors.azureLight,
        shadowColor: AppColors.azureDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
