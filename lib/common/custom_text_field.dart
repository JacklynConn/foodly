import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/common/app_style.dart';
import '/constants/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.keyboardType,
    this.controller,
    this.onEditingComplete,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.prefixIcon, this.hintText, this.contentPadding, this.maxLines,
  });

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: kGray, width: 0.4),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        cursorHeight: 20.h,
        maxLines: maxLines ?? 1,
        style: appStyle(11, kDark, FontWeight.normal),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: appStyle(11, kDark, FontWeight.normal),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}
