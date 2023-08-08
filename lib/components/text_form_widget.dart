import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/context_extensions.dart';
import '../utils/text_theme.dart';

TextFormField textFormWidget({
  required BuildContext context,
  required String hintText,
  void Function(String)? onChanged,
  bool? obsecureText,
  Widget? suffixIcon,
}) {
  return TextFormField(
    obscureText: obsecureText ?? false,
    onChanged: onChanged,
    textInputAction: TextInputAction.next,
    style: TextThemeLight.instance!.bodyMedium,
    cursorColor: ColorSchemeLight.instance!.darkBlue,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: TextThemeLight.instance!.bodyMedium.copyWith(
        color: ColorSchemeLight.instance!.grey,
      ),
      contentPadding: EdgeInsets.only(
        left: context.paddingNormal.left,
      ),
      filled: true,
      fillColor: ColorSchemeLight.instance!.lightGrey,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: ColorSchemeLight.instance!.lightGrey,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: ColorSchemeLight.instance!.lightGrey,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    ),
  );
}
