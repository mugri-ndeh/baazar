import '../../gen/fonts.gen.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: AppColors.gray50,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      unselectedIconTheme: IconThemeData(color: AppColors.gray500),
      selectedLabelStyle: TextStyle(
        color: AppColors.primary,
        fontFamily: FontFamily.roboto,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.gray500,
        fontFamily: FontFamily.roboto,
      ),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray500,
    ),
    chipTheme: ChipThemeData(),
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
        minimumSize: Size(double.infinity, 48.h),
        side: BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.sp),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: AppColors.primary,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.gray500,
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.sp),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
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
      displayLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.gray900,
        fontFamily: FontFamily.openSans,
      ),
      displayMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.gray900,
        fontFamily: FontFamily.openSans,
      ),
      displaySmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.gray900,
        fontFamily: FontFamily.openSans,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.gray900,
        fontFamily: FontFamily.roboto,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.gray900,
        fontFamily: FontFamily.roboto,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.gray900,
        fontFamily: FontFamily.roboto,
      ),
      // etc.
    ),
  );
}
