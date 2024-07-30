import 'package:comments/global/color_constants.dart';
import 'package:comments/global/extensions.dart';
import 'package:comments/global/size.dart';
import 'package:comments/global/text%20style/text_style.dart';
import 'package:comments/widgets/simple_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController _nameCont;
  late TextEditingController _emailCont;
  late TextEditingController _passCont;

  bool _showPass = false;

  bool _showLogin = false;

  @override
  void initState() {
    _nameCont = TextEditingController();
    _emailCont = TextEditingController();
    _passCont = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isValidEmail(String email) {
      // Null or empty string is not valid
      if (email.isEmpty) {
        return false;
      }

      // Pattern for email validation
      final RegExp emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        caseSensitive: false,
        multiLine: false,
      );

      // Check if the email matches the pattern
      return emailRegex.hasMatch(email);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.background,
      appBar: AppBar(
        backgroundColor: ColorConstant.background,
        title: Text(
          "Comments",
          style: UiTextStyle.title.large
              .copyWith(color: ColorConstant.primaryColor),
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.04),
        child: Column(
          children: [
            ((SizeConfig.screenHeight! * 0.2).toInt()).whitespaceHeight,
            Form(
                key: formKey,
                child: Column(
                  children: [
                    if (!_showLogin)
                      SimpleTextField(
                        textEditingController: _nameCont,
                        hintText: "John Doe",
                        labelText: "Name",
                        inputType: TextInputType.name,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value == " " ||
                              value == "") {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                      ),
                    20.whitespaceHeight,
                    SimpleTextField(
                      textEditingController: _emailCont,
                      hintText: "johndoe@gmail.com",
                      labelText: "Email",
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!isValidEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    20.whitespaceHeight,
                    SimpleTextField(
                      textEditingController: _passCont,
                      hintText: "********",
                      labelText: "Password",
                      obscure: !_showPass,
                      inputType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPass = !_showPass;
                            });
                          },
                          icon: Icon(
                            _showPass ? Icons.visibility_off : Icons.visibility,
                          )),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value == " " ||
                            value == "") {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            const Spacer(),
            Consumer<AuthProvider>(builder: (context, authProv, child) {
              return SizedBox(
                width: 200,
                child: PrimaryButton(
                  onTap: () {
                    bool vali = formKey.currentState!.validate();
                    if (vali) {
                      _showLogin
                          ? authProv.loginUser(
                              context, _emailCont.text, _passCont.text)
                          : authProv.signupUser(context, _emailCont.text,
                              _passCont.text, _nameCont.text);
                    }
                  },
                  buttonText: _showLogin ? "Login" : "SignUp",
                ),
              );
            }),
            10.whitespaceHeight,
            RichText(
              text: TextSpan(
                  text: _showLogin ? "New here? " : "Aleady have an account? ",
                  style: UiTextStyle.label.small,
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _showLogin = !_showLogin;
                          });
                        },
                      text: _showLogin ? "SignUp" : "Login",
                      style: UiTextStyle.title.small
                          .copyWith(color: ColorConstant.primaryColor),
                    )
                  ]),
            ),
            30.whitespaceHeight,
          ],
        ),
      ),
    );
  }
}
