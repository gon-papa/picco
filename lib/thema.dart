import 'package:flutter/material.dart';
import 'package:picco/main.dart';

class AppColors {
  // 男性向け
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

  // ダークモード
  static const Color backgroundDark = Color(0xFF1F1F1F);
  static const Color surfaceDark = Color(0xFF2C2C2C);
  static const Color onSurfaceDark = Color(0xFFE0E0E0);
  static const Color accentDarkPrimary = Color(0xFFBB86FC); // 明るい紫
  static const Color accentDarkSecondary = Color(0xFF03DAC6); // 明るいティール
  static const Color accentDarkWarning = Color(0xFFFFC107); // アンバー
  static const Color accentDarkSuccess = Color(0xFF4CAF50); // グリーン

  // 女性向け
  static const Color femaleLight = Color(0xFFFFEBEE);
  static const Color female = Color(0xFFE53935);
  static const Color femaleDark = Color(0xFFD32F2F);
  static const Color femaleAccent = Color(0xFFFF5722);

  // 共通
  static const Color slate = Color(0xFF64748B);
  static const Color slateDark = Color(0xFF1E293B);
}

class AppTheme {
  static ThemeData get male {
    final cs = ColorScheme.light(
      primary: AppColors.blue,
      onPrimary: Colors.white,
      secondary: AppColors.blue.shade700,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.slate,
      error: const Color(0xFFF87171),
      onError: Colors.white,
    );
    return ThemeData(
      colorScheme: cs,
      scaffoldBackgroundColor: cs.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cs.onPrimary,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.primary.withValues(alpha: 0.5),
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: AppColors.blue.shade50,
        shadowColor: AppColors.blue.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static ThemeData get female {
    final cs = ColorScheme.light(
      primary: AppColors.female,
      onPrimary: Colors.white,
      secondary: AppColors.femaleAccent,
      onSecondary: Colors.white,
      surface: AppColors.femaleLight,
      onSurface: AppColors.femaleDark,
      error: const Color(0xFFD32F2F),
      onError: Colors.white,
    );
    return ThemeData(
      colorScheme: cs,
      scaffoldBackgroundColor: cs.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cs.onPrimary,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.primary.withValues(alpha: 0.5),
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: AppColors.femaleLight,
        shadowColor: AppColors.femaleDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ダークモード
  static ThemeData get dark {
    final cs = ColorScheme.dark(
      primary: AppColors.blue.shade200,
      onPrimary: Colors.black,
      secondary: AppColors.blue.shade100,
      onSecondary: Colors.black,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      error: Color(0xFFCF6679),
      onError: Colors.white,
    );
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: cs,
      scaffoldBackgroundColor: cs.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cs.surface,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.onSurface.withValues(alpha: 0.7),
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: cs.surface,
        shadowColor: cs.onSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: Typography.whiteMountainView,
    );
  }
}

class AppGradients {
  // ダークモード
  static LinearGradient primaryDark = LinearGradient(
    colors: [AppColors.accentDarkPrimary, AppColors.accentDarkSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient primary = LinearGradient(
    colors: [AppColors.blue.shade900, AppColors.blue.shade500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient female = LinearGradient(
    colors: [AppColors.femaleDark, AppColors.femaleAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient getGradient(AppMode mode) {
    switch (mode) {
      case AppMode.male:
        return primary;
      case AppMode.female:
        return female;
      case AppMode.dark:
        return primaryDark;
    }
  }
}
