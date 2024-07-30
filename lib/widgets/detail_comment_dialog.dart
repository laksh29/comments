import 'package:comments/global/extensions.dart';
import 'package:flutter/material.dart';

import '../global/text style/text_style.dart';
import '../services/navigator.dart';
import 'dual_text_widget.dart';
import 'user_profile_avatar.dart';

class DetailCommentDialog extends StatelessWidget {
  const DetailCommentDialog({
    super.key,
    required this.name,
    required this.email,
    required this.comment,
  });

  final String name;
  final String email;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => NavigatorService().pop(context),
                icon: const Icon(Icons.close)),
          ),
          Center(
            child: UserProfileAvatar(
              letter: name[0].toUpperCase(),
            ),
          ),
          10.whitespaceHeight,
          DualTextWidget(titleText: "Name:", dataText: name),
          5.whitespaceHeight,
          DualTextWidget(titleText: "Email:", dataText: email),
          10.whitespaceHeight,
          Text(
            comment,
            style: UiTextStyle.label.medium,
          )
        ],
      ),
    );
  }
}
