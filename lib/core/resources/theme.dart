import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

ThemeData getAppTheme() {
  return ThemeData.dark().copyWith(
    // main colors
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    primaryColor: AppColors.primary,

    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.secondary,
      background: AppColors.secondary,
      secondary: AppColors.accent,
      error: AppColors.error,
    ),

    // Bottom nav bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundSecondary,
      selectedIconTheme: IconThemeData(size: AppSize.s20.sp),
      unselectedIconTheme: IconThemeData(size: AppSize.s20.sp),
      selectedLabelStyle: TextStyle(fontSize: AppSize.s12.sp),
      unselectedLabelStyle: TextStyle(fontSize: AppSize.s12.sp),
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.disabled,
      type: BottomNavigationBarType.fixed,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundSecondary,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: _getTextStyle(
        fontSize: AppFontSize.f14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      // title text
      titleLarge: _getTextStyle(
          fontSize: AppFontSize.f20.sp,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold),
      titleMedium: _getTextStyle(
        fontSize: AppFontSize.f18.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: _getTextStyle(
        fontSize: AppFontSize.f14.sp,
        color: AppColors.textSecondary,
      ),

      // body text
      bodyLarge: _getTextStyle(
          fontSize: AppFontSize.f14.sp, color: AppColors.textPrimary),
      bodyMedium: _getTextStyle(
          fontSize: AppFontSize.f12.sp, color: AppColors.textPrimary),
      bodySmall: _getTextStyle(
          fontSize: AppFontSize.f12.sp, color: AppColors.textSecondary),
    ),

    splashFactory: InkSplash.splashFactory,
    // button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accent,
        textStyle: _getTextStyle(
            fontSize: AppFontSize.f14.sp, color: AppColors.accent),
        splashFactory: NoSplash.splashFactory,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 0.1,
    ),

    // bottom sheet theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      dragHandleColor: AppColors.divider,
      dragHandleSize: Size(AppWidth.w40.w, AppHeight.h4.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.s20.r),
        ),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: _getTextStyle(
          fontSize: AppFontSize.f14.sp,
          color: AppColors.textPrimary,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
      ),
    ),

    // cupertino override theme
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.primary,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: _getTextStyle(
          fontSize: AppFontSize.f18.sp,
          color: AppColors.textPrimary,
        ),
        textStyle: _getTextStyle(
          fontSize: AppFontSize.f14.sp,
          color: AppColors.textPrimary,
        ),
      ),
    ),
  );
}

TextStyle _getTextStyle({
  required double fontSize,
  FontWeight? fontWeight,
  required Color color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );
}
