// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color bGColor1;
  Color bGColor1Text1;
  Color bGColor1Text2;
  Color bGColor2;
  Color bGColor2Text1;
  Color bGColor2Text2;
  Color baseTextColorMain;
  Color baseTextColorSupport;
  Color transparentTertiary;
  Color trnsparentMain;
  Color tertiary05;

  TextStyle get title1 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.w900,
        fontSize: 60,
        fontStyle: FontStyle.normal,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.w500,
        fontSize: 30,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorSupport,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorMain,
        fontWeight: FontWeight.w200,
        fontSize: 16,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Comfortaa',
        color: baseTextColorSupport,
        fontWeight: FontWeight.w200,
        fontSize: 16,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFC33C54);
  Color secondaryColor = const Color(0xFFFFFFFF);
  Color tertiaryColor = const Color(0xFF7B7777);
  Color alternate = const Color(0x00000000);
  Color primaryBackground = const Color(0x00000000);
  Color secondaryBackground = const Color(0x00000000);
  Color primaryText = const Color(0x00000000);
  Color secondaryText = const Color(0x00000000);

  Color bGColor1 = Color(0xFFFFFFFF);
  Color bGColor1Text1 = Color(0xFF000000);
  Color bGColor1Text2 = Color(0xFF7B7777);
  Color bGColor2 = Color(0xFFFFFFFF);
  Color bGColor2Text1 = Color(0xFF000000);
  Color bGColor2Text2 = Color(0xFF7B7777);
  Color baseTextColorMain = Color(0xFF000000);
  Color baseTextColorSupport = Color(0xFF7B7777);
  Color transparentTertiary = Color(0x0D7B7777);
  Color trnsparentMain = Color(0x0CC33C54);
  Color tertiary05 = Color(0x7F7B7777);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
