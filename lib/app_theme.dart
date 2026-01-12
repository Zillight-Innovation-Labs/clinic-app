import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: appScreenBackground,
    primaryColor: appColorPrimary,
    primaryColorDark: appColorPrimary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: appColorPrimary,
      primary: appColorPrimary,
      surface: const Color(0xFFF1F3F4),
      secondary: appColorSecondary,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    hoverColor: Colors.white54,
    dividerColor: const Color(0xFF626E8A),
    fontFamily: GoogleFonts.interTight().fontFamily,
    drawerTheme: const DrawerThemeData(backgroundColor: appScreenBackground),
    appBarTheme: AppBarTheme(
      surfaceTintColor: appLayoutBackground,
      color: appLayoutBackground,
      iconTheme: const IconThemeData(color: textPrimaryColor),
      titleTextStyle: TextStyle(
        color: canvasColor,
        fontFamily: GoogleFonts.interTight().fontFamily,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
    ),
    tabBarTheme: const TabBarThemeData(indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Color(0xFFB6D5EF), width: 3))),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    cardTheme: const CardThemeData(color: Colors.white),
    cardColor: appSectionBackground,
    iconTheme: const IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: GoogleFonts.interTightTextTheme(),
    //visualDensity: VisualDensity.adaptivePlatformDensity,
    // radioTheme: RadioThemeData(
    //   fillColor: WidgetStateProperty.all(appColorPrimary),
    // ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appScreenBackgroundDark,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      surfaceTintColor: appScreenBackgroundDark,
      color: appScreenBackgroundDark,
      iconTheme: const IconThemeData(color: whiteColor),
      titleTextStyle: TextStyle(
        color: whiteTextColor,
        fontFamily: GoogleFonts.interTight().fontFamily,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light),
    ),
    primaryColor: appColorPrimary,
    dividerColor: canvasColor,
    primaryColorDark: appColorPrimary,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.interTight().fontFamily,
    drawerTheme: const DrawerThemeData(backgroundColor: fullDarkCanvasColorDark),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(titleLarge: primaryTextStyle(color: Colors.black), labelSmall: primaryTextStyle(color: Colors.black)),
    cardTheme: const CardThemeData(color: cardBackgroundBlackDark),
    cardColor: cardBackgroundBlackDark,
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: appColorPrimary),
      titleLarge: TextStyle(color: textPrimaryColor),
      titleSmall: TextStyle(color: textSecondaryColor),
    ),
    tabBarTheme: const TabBarThemeData(indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.white))),
    // radioTheme: RadioThemeData(
    //   fillColor: WidgetStateProperty.all(appColorPrimary),
    // ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
    colorScheme: const ColorScheme.dark(
      primary: appBackgroundColorDark,
      onPrimary: cardBackgroundBlackDark,
      secondary: whiteColor,
      error: Color(0xFFCF6676),
    ),
  ).copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: appColorPrimary),
  );
}
