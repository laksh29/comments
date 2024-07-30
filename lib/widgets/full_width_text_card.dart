import 'package:flutter/material.dart';

import '../global/color_constants.dart';
import '../global/size.dart';
import '../global/text style/text_style.dart';

class FullWidthTextCard extends StatelessWidget {
  const FullWidthTextCard({
    super.key,
    required this.text,
    this.textStyle,
    this.cardColor,
  });
  final String text;
  final TextStyle? textStyle;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: cardColor ?? ColorConstant.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: textStyle ?? UiTextStyle.label.medium,
      ),
    );
  }
}
