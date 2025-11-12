import 'package:baazar/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    bottomAppBarTheme: BottomAppBarThemeData(surfaceTintColor: AppColors.white),
    buttonTheme: ButtonThemeData(
      height: 48.h,
      minWidth: 327.w,
      buttonColor: AppColors.primary,
      disabledColor: AppColors.gray500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(48.sp),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(327.w, 48.h),
        side: BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.sp),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.gray500,
        minimumSize: Size(327.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.sp),
        ),
      ),
    ),

    appBarTheme: AppBarThemeData(surfaceTintColor: AppColors.white),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.white,
      onPrimary: AppColors.gray900,
      secondary: AppColors.primary,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.gray900,
    ),
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      displayLarge: TextStyle(),
      bodyLarge: TextStyle(),
      // etc.
    ),
  );
}
