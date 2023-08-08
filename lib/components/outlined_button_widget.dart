import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/context_extensions.dart';
import '../utils/text_theme.dart';

Widget outlinedButtonWidget(
    {required BuildContext context,
    required String icon,
    required String item}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(
        160,
        60,
      ),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        side: BorderSide(
          width: 2,
          color: ColorSchemeLight.instance!.grey,
        ),
      ),
      minimumSize: Size.zero,
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingLow.horizontal,
        vertical: context.paddingLow.vertical * 0.6,
      ),
      elevation: 0,
    ),
    onPressed: () {},
    icon: Image.asset(
      "assets/images/$icon.png",
      height: context.mediumValue,
      width: context.mediumValue,
      fit: BoxFit.cover,
    ),
    label: Text(
      item,
      style: TextThemeLight.instance!.button,
    ),
  );
}
