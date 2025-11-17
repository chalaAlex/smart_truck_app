import 'package:flutter/material.dart';

class ColorManager {
  // Primary Colors
  static Color primary = HexColor.fromHex('#ffff660e');
  static Color primaryDark = HexColor.fromHex('#FF075E54');
  static Color primaryLight = HexColor.fromHex('#6E57C0');

  // Secondary Colors
  static Color secondary = HexColor.fromHex('#998FBC');

  // Neutral Colors
  static Color white = HexColor.fromHex('#FFFFFF'); // 
  static Color black = HexColor.fromHex('#000000');
  static Color lightInactive = HexColor.fromHex('#F4F4F4');
  static Color darkInactive = HexColor.fromHex('#1A1A1A');

  // Accent Colors
  static Color accentYellow = HexColor.fromHex('#F8C146');

  // Borders
  static Color lightBorder = HexColor.fromHex('#E0E0E0');
  static Color darkBorder = HexColor.fromHex('#333333');

  // Text Colors
  static Color primaryTextLight = HexColor.fromHex('#000000');
  static Color secondaryTextLight = HexColor.fromHex('#666666');
  static Color primaryTextDark = HexColor.fromHex('#FFFFFF');
  static Color secondaryTextDark = HexColor.fromHex('#B5B5B5'); 

  //background color
  static Color backGroundColor = HexColor.fromHex('#F7F9FB');

  // Container Box Color
  static Color containerBoxColor= HexColor.fromHex('#3366FF');
  static Color buttonColor= HexColor.fromHex('#C4A484');
  static Color roundedBoxBackground = HexColor.fromHex("#D8FFDC");
  static Color roundedBoxForeground = HexColor.fromHex("#1B9100");

  // Form and Error Colors
  static Color errorRed = HexColor.fromHex('#D9261C');
  static Color formBg = HexColor.fromHex('#E0F0F0');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}