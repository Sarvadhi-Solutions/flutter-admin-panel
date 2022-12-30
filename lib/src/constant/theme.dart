import 'package:admin_dash/src/constant/color.dart';
import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    isDark = isDarkTheme;
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Nunito",
      applyElevationOverlayColor: false,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorSchemeSeed: ColorConst.primary,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor:
            isDarkTheme ? ColorConst.scaffoldDark : ColorConst.drawerBG,
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? ColorConst.scaffoldDark : ColorConst.drawerBG,
      cardTheme: CardTheme.of(context).copyWith(
        margin: EdgeInsets.zero,
        color: isDarkTheme ? ColorConst.cardDark : Colors.white,
        surfaceTintColor: isDarkTheme ? ColorConst.cardDark : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 10.0,
        shadowColor: isDarkTheme
            ? Colors.transparent
            : Colors.grey.shade50.withOpacity(0.25),
      ),
      checkboxTheme: const CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
    );
  }
}

bool isDark = false;
