import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? boarderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback
      onPressed; //* Void callback is a function that doesn't return anything and doesn't take any arguments.

  const AppTextButton(
      {super.key,
      this.boarderRadius,
      this.horizontalPadding,
      this.verticalPadding,
      this.backgroundColor,
      this.buttonWidth,
      this.buttonHeight,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(boarderRadius?.r ?? 16.r))),
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? Colors.blue),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h)),
        fixedSize: WidgetStateProperty.all(
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h)),
      ),
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
