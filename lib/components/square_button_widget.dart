import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';

Widget squareButtonWidget(
    {required BuildContext context,
    required Color buttonColor,
    required Color iconColor,
    required IconData icon,
    required void Function() onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: buttonColor,
    ),
    onPressed: onPressed,
    child: Padding(
      padding: context.paddingLow * 1.5,
      child: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
    ),
  );
}
