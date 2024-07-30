import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_constants.dart';

class HeadingStyle {
  const HeadingStyle();

  TextStyle fromString(String s) {
    switch (s) {
      case 'large':
        return large;
      case 'largeRegular':
        return largeRegular;
      case 'mediumRegular':
        return mediumRegular;
      case 'small':
        return small;
      case 'smallRegular':
        return smallRegular;
      case 'extraSmall':
        return extraSmall;
      case 'medium':
      default:
        return medium;
    }
  }

  //large bold
  TextStyle get large => GoogleFonts.poppins(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        height: 1.18,
        color: ColorConstant.black,
      );

  //large regular
  TextStyle get largeRegular => GoogleFonts.poppins(
        fontSize: 34,
        height: 1.18,
        color: ColorConstant.black,
      );

  // medium bold
  TextStyle get medium => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: ColorConstant.black,
      );

  // medium regular
  TextStyle get mediumRegular => GoogleFonts.poppins(
        fontSize: 24,
        height: 1.4,
        color: ColorConstant.black,
      );

  // small bold
  TextStyle get small => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: ColorConstant.black,
      );

  // small regular
  TextStyle get smallRegular => GoogleFonts.poppins(
        fontSize: 20,
        height: 1.3,
        color: ColorConstant.black,
      );

  // extraSmall
  TextStyle get extraSmall => GoogleFonts.poppins(
        fontSize: 20,
        height: 1.3,
        color: ColorConstant.black,
      );
}
