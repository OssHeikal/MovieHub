import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF121212);
  static const Color secondary = Color(0xFF1A1A1A);

  static const Color secondarySwatch = Color(0xFF414141);

  static const Color accent = Color(0xFF0088FF);
  // static const Color accent = Color(0xFFEDC748);

  static const Color backgroundPrimary = Color(0xFF080808);
  static const Color backgroundSecondary = Color(0xFF242424);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);

  static const Color error = Color(0xFFFF0000);
  static const Color success = Color(0xFF00FF00);
  static const Color warning = Color(0xFFFFCC00);

  static const Color disabled = Color(0xFF828282);

  static const Color divider = Color(0xFF5E6065);

  // custom colors
  static const Color rating = Color(0xFFEDC748);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color transparent = Colors.transparent;
}

class AppGradient {
  static LinearGradient primary = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.1, 0.15, 0.25, 1],
    colors: [
      AppColors.backgroundPrimary.withOpacity(1),
      AppColors.backgroundPrimary.withOpacity(0.95),
      AppColors.backgroundPrimary.withOpacity(0.90),
      AppColors.backgroundPrimary.withOpacity(0.0),
    ],
  );
  static LinearGradient secondary = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.15, 0.25, 1],
    colors: [
      AppColors.primary.withOpacity(1),
      AppColors.primary.withOpacity(0.99),
      AppColors.primary.withOpacity(0.0),
    ],
  );

  static LinearGradient primaryBottom = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.05, 0.35, 0.5, 1.0],
    colors: [
      AppColors.backgroundPrimary.withOpacity(1.0),
      AppColors.backgroundPrimary.withOpacity(0.75),
      AppColors.backgroundPrimary.withOpacity(0.5),
      AppColors.backgroundPrimary.withOpacity(0.0),
    ],
  );
  static LinearGradient secondaryBottom = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.0, 0.2, 0.4],
    colors: [
      AppColors.primary.withOpacity(1.0),
      AppColors.primary.withOpacity(0.5),
      AppColors.primary.withOpacity(0.0),
    ],
  );

  static LinearGradient primaryTop = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.15, 0.35, 0.5, 1.0],
    colors: [
      AppColors.backgroundPrimary.withOpacity(1.0),
      AppColors.backgroundPrimary.withOpacity(0.75),
      AppColors.backgroundPrimary.withOpacity(0.5),
      AppColors.backgroundPrimary.withOpacity(0.0),
    ],
  );
}




// class IMDbColors {
//   static const Color primary = Color(0xFF101010); // Primary background color
//   static const Color accent = Color(0xFFFFC107); // Accent color

//   // Text colors
//   static const Color textPrimary = Color(0xFFFFFFFF); // Primary text color
//   static const Color textSecondary = Color(0xFFBDBDBD); // Secondary text color

//   // Button colors
//   static const Color buttonPrimary =
//       Color(0xFF101010); // Primary button background color
//   static const Color buttonPrimaryText =
//       Color(0xFFFFFFFF); // Primary button text color
//   static const Color buttonSecondary =
//       Color(0xFFFFC107); // Secondary button background color
//   static const Color buttonSecondaryText =
//       Color(0xFF101010); // Secondary button text color

//   // Divider color
//   static const Color divider = Color(0xFF616161); // Divider color

//   // Rating colors
//   static const Color ratingStarFilled =
//       Color(0xFFFFC107); // Filled rating star color
//   static const Color ratingStarEmpty =
//       Color(0xFFBDBDBD); // Empty rating star color
// }


// 6797E8