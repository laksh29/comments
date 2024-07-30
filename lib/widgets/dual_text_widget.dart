import 'package:flutter/widgets.dart';

import '../global/color_constants.dart';
import '../global/text style/text_style.dart';

class DualTextWidget extends StatelessWidget {
  const DualTextWidget({
    super.key,
    required this.titleText,
    required this.dataText,
    this.titleStyle,
    this.dataStyle,
    this.maxLines,
  });

  final String titleText;
  final String dataText;
  final TextStyle? titleStyle;
  final TextStyle? dataStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: maxLines,
        overflow: TextOverflow.clip,
        text: TextSpan(
            text: '$titleText ',
            style: titleStyle ??
                UiTextStyle.label.medium.copyWith(
                  color: ColorConstant.primaryColor,
                  fontStyle: FontStyle.italic,
                ),
            children: [
              TextSpan(
                  text: dataText,
                  style: dataStyle ??
                      UiTextStyle.label.medium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.black.withOpacity(0.3),
                        fontStyle: FontStyle.normal,
                      ))
            ]));
  }
}
