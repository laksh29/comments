import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_constants.dart';

class TitleStyle {
  const TitleStyle();

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
      case 'medium':
      default:
        return medium;
    }
  }

  //large bold
  TextStyle get large => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: ColorConstant.black,
      );

  //large regular
  TextStyle get largeRegular => GoogleFonts.poppins(
        fontSize: 18,
        height: 1.2,
        color: ColorConstant.black,
      );

  // medium bold
  TextStyle get medium => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: ColorConstant.black,
      );

  // medium regular
  TextStyle get mediumRegular => GoogleFonts.poppins(
        fontSize: 16,
        height: 1.3,
        color: ColorConstant.black,
      );

  // small bold
  TextStyle get small => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: ColorConstant.black,
      );

  // small regular
  TextStyle get smallRegular => GoogleFonts.poppins(
        fontSize: 14,
        height: 1.5,
        color: ColorConstant.black,
      );
}
