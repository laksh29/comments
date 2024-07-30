import 'package:comments/global/color_constants.dart';
import 'package:comments/global/size.dart';
import 'package:comments/global/text%20style/text_style.dart';
import 'package:comments/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) =>
        Provider.of<AuthProvider>(context, listen: false).autoLogin(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background,
      body: SizedBox(
        width: SizeConfig.screenWidth,
        child: Center(
          child: TypeWriter.text(
            'comments...     ',
            style: UiTextStyle.title.large
                .copyWith(color: ColorConstant.primaryColor),
            duration: const Duration(milliseconds: 150),
          ),
        ),
      ),
    );
  }
}
