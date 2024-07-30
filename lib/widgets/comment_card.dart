import 'package:comments/global/extensions.dart';
import 'package:flutter/material.dart';

import '../global/color_constants.dart';
import '../global/text style/text_style.dart';
import 'detail_comment_dialog.dart';
import 'dual_text_widget.dart';
import 'user_profile_avatar.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
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
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => DetailCommentDialog(
                name: name, email: email, comment: comment));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileAvatar(
              letter: name[0].toUpperCase(),
            ),
            10.whitespaceWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DualTextWidget(
                      titleText: "Name:", dataText: name, maxLines: 1),
                  5.whitespaceHeight,
                  DualTextWidget(
                      titleText: "Email:", dataText: email, maxLines: 1),
                  10.whitespaceHeight,
                  Text(
                    comment,
                    style: UiTextStyle.label.medium,
                    maxLines: 4,
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
