import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      primarySwatch: Colors.grey,
      appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white.withOpacity(0.7)),
      ),
      splashColor: Colors.white.withOpacity(0.7),
      iconTheme: IconThemeData(color: AppColors.white.withOpacity(0.7)),
      textTheme: TextTheme(
        //for artist name
        titleSmall: TextStyle(
          letterSpacing: 0,
          color: AppColors.white.withOpacity(0.7),
          fontFamily: 'Spartan',
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),

        //for Song name
        headlineMedium: TextStyle(
          color: AppColors.white.withOpacity(0.9),
          fontFamily: 'Spartan',
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.grey,
      splashColor: Colors.green.withOpacity(0.07),
      iconTheme: IconThemeData(color: AppColors.black.withOpacity(0.25)),
       appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black.withOpacity(0.25)),
      ),
      textTheme: TextTheme(
        //for artist name
        titleSmall: TextStyle(
          letterSpacing: 0,
          color: AppColors.black.withOpacity(0.25),
          fontFamily: 'Spartan',
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),

        //for Song name
        headlineMedium: const TextStyle(
          color: AppColors.primaryBlack,
          fontFamily: 'Spartan',
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
