import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xff22AAA1);
const Color accentColor = Color(0xffffffff);
const Color textDark = Color(0xff080808);

ThemeData mainThemeLight(BuildContext context) {
  String themeFontFamily =
      EasyLocalization.of(context).locale == Locale('ar', 'IQ')
          ? GoogleFonts.tajawal().fontFamily
          : GoogleFonts.lato().fontFamily;
  String themeTitleFontFamily =
      EasyLocalization.of(context).locale == Locale('ar', 'IQ')
          ? GoogleFonts.tajawal().fontFamily
          : GoogleFonts.fredokaOne().fontFamily;
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: themeFontFamily,
    // scaffoldBackgroundColor: primaryColor,
    accentColor: accentColor,
    primaryColor: primaryColor,
    primaryIconTheme: IconThemeData(color: accentColor),
    primaryTextTheme: TextTheme(
        headline1:
            TextStyle(fontFamily: themeTitleFontFamily, color: accentColor)),
    backgroundColor: Colors.black.withOpacity(0.04),
    buttonColor: textDark,
    bottomAppBarColor: Colors.white,
    accentTextTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
    textTheme: TextTheme(
        headline1: TextStyle(color: textDark.withOpacity(0.9)),
        bodyText1: TextStyle(color: textDark.withOpacity(0.95))),
    hintColor: Colors.black.withOpacity(0.35),
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
          textStyle:
              TextStyle(fontFamily: themeFontFamily, color: Colors.black)),
    ),
  );
}
