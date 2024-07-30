import 'package:flutter/material.dart';

import '../global/color_constants.dart';
import '../global/text style/text_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.buttonWidget,
    this.onTap,
  });
  final String buttonText;
  final Widget? buttonWidget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: ColorConstant.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: buttonWidget ??
              Text(
                buttonText,
                style: UiTextStyle.title.medium
                    .copyWith(color: ColorConstant.white),
              ),
        ),
      ),
    );
  }
}
