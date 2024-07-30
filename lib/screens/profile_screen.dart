import 'dart:io';

import 'package:comments/global/color_constants.dart';
import 'package:comments/global/extensions.dart';
import 'package:comments/providers/auth_provider.dart';
import 'package:comments/providers/firestore_provider.dart';
import 'package:comments/services/navigator.dart';
import 'package:comments/widgets/primary_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../global/size.dart';
import '../global/text style/text_style.dart';
import '../widgets/full_width_text_card.dart';
import '../widgets/user_profile_avatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
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
          "Profile",
          style: UiTextStyle.title.large.copyWith(color: ColorConstant.white),
        ),
        leading: IconButton(
            onPressed: () => NavigatorService().pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: Consumer<FirestoreProvider>(builder: (context, fireProv, child) {
        return fireProv.user == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.primaryColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.04),
                child: SizedBox(
                  height: SizeConfig.screenHeight,
                  child: Center(
                    child: Column(
                      children: [
                        UserProfileAvatar(
                          radius: 50,
                          letter: fireProv.user!.name[0].toUpperCase(),
                          textStyle: UiTextStyle.heading.large,
                          profile: fireProv.user?.profile,
                        ),
                        5.whitespaceHeight,
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const EditProfileDialog());
                          },
                          child: const Text("Edit profile"),
                        ),
                        25.whitespaceHeight,
                        FullWidthTextCard(
                          text: fireProv.user!.name,
                        ),
                        10.whitespaceHeight,
                        FullWidthTextCard(
                          text: fireProv.user!.email,
                        ),
                        const Spacer(),
                        PrimaryButton(
                          buttonText: "LogOut",
                          onTap: () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .logout(context);
                          },
                        ),
                        20.whitespaceHeight,
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({
    super.key,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  XFile? imageFile;

  Future _pickImage() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  Future<String> uploadImageToFirebase(
      BuildContext context, imageCaptured, String uid) async {
    final pickedFile = imageCaptured;

    String path = 'comments/profile/$uid';

    final file = File(pickedFile!.path);

    final storageRef = FirebaseStorage.instance.ref().child(path);

    final uploadImage = storageRef.putFile(file);

    final imageSnapshot = await uploadImage.whenComplete(() {});

    final url = await imageSnapshot.ref.getDownloadURL();

    return url;
  }

  @override
  void initState() {
    _pickImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Edit Profile",
            style: UiTextStyle.label.medium,
          ),
          const Spacer(),
          IconButton(
              onPressed: () => NavigatorService().pop(context),
              icon: const Icon(Icons.close))
        ],
      ),
      content: Consumer<FirestoreProvider>(builder: (context, fireProv, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: imageFile != null
                  ? FileImage(File(imageFile?.path ?? ""))
                  : fireProv.user!.profile != null
                      ? NetworkImage(fireProv.user!.profile!)
                      : null,
              child: imageFile == null && fireProv.user!.profile == null
                  ? Center(
                      child: Text(
                        fireProv.user!.name[0].toUpperCase(),
                        style: UiTextStyle.heading.large,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            5.whitespaceHeight,
            GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: const Text("Change Image")),
          ],
        );
      }),
      actions: [
        Consumer<AuthProvider>(builder: (context, authProv, child) {
          return PrimaryButton(
            buttonText: "Save",
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: ColorConstant.white,
                        ),
                      ));
              String url = await uploadImageToFirebase(
                  context, imageFile, authProv.userId!);

              Provider.of<FirestoreProvider>(context, listen: false)
                  .updateUserDoc(context, 'profile', url);

              Provider.of<FirestoreProvider>(context, listen: false)
                  .getUserDoc(context);

              NavigatorService().pop(context);
              NavigatorService().pop(context);
            },
          );
        })
      ],
    );
  }
}
