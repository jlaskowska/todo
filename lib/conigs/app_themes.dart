import 'package:flutter/material.dart';
import 'package:todo/conigs/app_colors.dart';

class AppThemes {
  static final light = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    accentColor: AppColors.darkBlue,
    bottomAppBarColor: AppColors.lightPanel,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    accentColor: AppColors.pink,
    bottomAppBarColor: AppColors.darkPanel,
  );
}
