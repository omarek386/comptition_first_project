import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? backGroundColor;
  final TextEditingController? controller;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.controller,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      required this.hintText,
      this.hintStyle,
      this.suffixIcon,
      this.obscureText,
      this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
        hintStyle: hintStyle ??
            TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backGroundColor ?? Colors.grey[200],
      ),
      obscureText: obscureText ?? false,
      style: inputTextStyle ??
          TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.blue[900]),
    );
  }
}
