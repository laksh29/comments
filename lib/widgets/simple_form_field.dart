import 'package:comments/global/color_constants.dart';
import 'package:comments/global/extensions.dart';
import 'package:comments/global/text%20style/text_style.dart';
import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    required this.textEditingController,
    this.prefixText,
    this.hintText,
    this.inputType,
    this.maxLength,
    this.displayTextStyle,
    this.labelText,
    this.obscure,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController textEditingController;
  final String? prefixText;
  final String? hintText;
  final String? labelText;
  final TextInputType? inputType;
  final int? maxLength;
  final TextStyle? displayTextStyle;
  final bool? obscure;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? "",
          style: UiTextStyle.label.small,
        ),
        5.whitespaceHeight,
        SizedBox(
          child: TextFormField(
            controller: textEditingController,
            maxLength: maxLength,
            keyboardType: inputType ?? TextInputType.phone,
            style: displayTextStyle,
            obscureText: obscure ?? false,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(color: ColorConstant.black.withOpacity(0.3)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: textFieldBorder(),
              enabledBorder: textFieldBorder(),
              focusedBorder: textFieldBorder(),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(6.0),
    );
  }
}
