import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_constants.dart';

class DisplayStyle {
  const DisplayStyle();

  TextStyle fromString(String s) {
    switch (s) {
      case 'large':
        return large;
      case 'small':
        return small;
      case 'extraSmall':
        return extraSmall;
      case 'medium':
      default:
        return medium;
    }
  }

  //large
  TextStyle get large => GoogleFonts.poppins(
        fontSize: 58,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: ColorConstant.black,
        letterSpacing: -0.25,
      );

  // medium
  TextStyle get medium => GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        height: 1.15,
        color: ColorConstant.black,
        letterSpacing: -0.25,
      );

  // small
  TextStyle get small => GoogleFonts.poppins(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        height: 1.22,
        color: ColorConstant.black,
        letterSpacing: -0.25,
      );

  // extraSmall
  TextStyle get extraSmall => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.14,
        color: ColorConstant.black,
        letterSpacing: -0.25,
      );
}
