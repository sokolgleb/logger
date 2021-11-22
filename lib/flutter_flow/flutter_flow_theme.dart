import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFFC33C54);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color tertiaryColor = Color(0xFF7B7777);

  static const Color bGColor1 = Color(0xFFFFFFFF);
  static const Color bGColor1Text1 = Color(0xFF000000);
  static const Color bGColor1Text2 = Color(0xFF7B7777);
  static const Color bGColor2 = Color(0xFFFFFFFF);
  static const Color bGColor2Text1 = Color(0xFF000000);
  static const Color bGColor2Text2 = Color(0xFF7B7777);
  static const Color baseTextColorMain = Color(0xFF000000);
  static const Color baseTextColorSupport = Color(0xFF7B7777);
  static const Color transparentTertiary = Color(0x0D7B7777);
  static const Color trnsparentMain = Color(0x0CC33C54);
  static const Color tertiary05 = Color(0x7F7B7777);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';
  static TextStyle get title1 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.w900,
        fontSize: 60,
        fontStyle: FontStyle.normal,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.w500,
        fontSize: 30,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorSupport,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.w200,
        fontSize: 16,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorSupport,
        fontWeight: FontWeight.w200,
        fontSize: 16,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            );
}
