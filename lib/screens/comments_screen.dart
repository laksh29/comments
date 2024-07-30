import 'package:comments/global/color_constants.dart';
import 'package:comments/global/extensions.dart';
import 'package:comments/providers/comments_provider.dart';
import 'package:comments/providers/firestore_provider.dart';
import 'package:comments/screens/profile_screen.dart';
import 'package:comments/services/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/size.dart';
import '../global/text style/text_style.dart';
import '../widgets/comment_card.dart';
import '../widgets/user_profile_avatar.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) =>
        Provider.of<CommentsProvider>(context, listen: false)
            .getComments(context));

    Future.delayed(Duration.zero).then((_) =>
        Provider.of<FirestoreProvider>(context, listen: false)
            .getUserDoc(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background,
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        title: Text(
          "Comments",
          style: UiTextStyle.title.large.copyWith(color: ColorConstant.white),
        ),
        actions: [
          Consumer<FirestoreProvider>(builder: (context, fireProv, child) {
            return IconButton(
              onPressed: () =>
                  NavigatorService().navigate(context, const ProfileScreen()),
              icon: UserProfileAvatar(
                radius: 15.0,
                letter: fireProv.user?.name[0].toUpperCase() ?? "",
              ),
            );
          })
        ],
      ),
      body: Consumer<CommentsProvider>(builder: (context, comProv, child) {
        return !comProv.isLoaded
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : comProv.commentsList.isEmpty
                ? Center(
                    child: Text(
                      "There are no comments at the moment",
                      style: UiTextStyle.label.medium,
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.04),
                    itemCount: comProv.commentsList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CommentCard(
                        name: comProv.commentsList.elementAt(index)!.name,
                        email: comProv.commentsList.elementAt(index)!.email,
                        comment: comProv.commentsList.elementAt(index)!.comment,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return 20.whitespaceHeight;
                    },
                  );
      }),
    );
  }
}
