import 'package:flutter/material.dart';

import '../global/color_constants.dart';
import '../global/text style/text_style.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
    this.radius,
    this.textStyle,
    required this.letter,
    this.profile,
  });
  final double? radius;
  final TextStyle? textStyle;
  final String letter;
  final String? profile;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorConstant.grey,
      radius: radius,
      backgroundImage: profile != null ? NetworkImage(profile!) : null,
      child: profile == null
          ? Center(
              child: Text(
                letter,
                style: textStyle ?? UiTextStyle.title.medium,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
