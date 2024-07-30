import 'package:flutter/material.dart';

import 'body_style.dart';
import 'display_style.dart';
import 'heading_style.dart';
import 'label_style.dart';
import 'title_style.dart';

class UiTextStyle {
  // display
  static DisplayStyle get display => const DisplayStyle();

  // heading
  static HeadingStyle get heading => const HeadingStyle();

  // title
  static TitleStyle get title => const TitleStyle();

  // body
  static BodyStyle get body => const BodyStyle();

  // label
  static LabelStyle get label => const LabelStyle();

  TextStyle fromString(String s) {
    List<String> textStyle = s.split(".");
    String semanticType = textStyle[0];
    String sizeType = textStyle[1];

    switch (semanticType) {
      case 'display':
        return display.fromString(sizeType);
      case 'heading':
        return heading.fromString(sizeType);
      case 'title':
        return title.fromString(sizeType);
      case 'body':
        return body.fromString(sizeType);
      case 'label':
        return label.fromString(sizeType);
      default:
        return body.largeRegular;
    }
  }
}
