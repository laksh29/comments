import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_constants.dart';

class LabelStyle {
  const LabelStyle();

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
        fontSize: 18,
        height: 1.2,
        color: ColorConstant.black,
      );

  // medium
  TextStyle get medium => GoogleFonts.poppins(
        fontSize: 16,
        height: 1.3,
        color: ColorConstant.black,
      );

  // small
  TextStyle get small => GoogleFonts.poppins(
        fontSize: 14,
        height: 1.5,
        color: ColorConstant.black,
      );

  // extraSmall
  TextStyle get extraSmall => GoogleFonts.poppins(
        fontSize: 10,
        height: 1.3,
        color: ColorConstant.black,
      );
}
