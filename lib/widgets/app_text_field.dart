import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_color.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String hintText;
  final TextInputType? keybardType;

  const AppTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.keybardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0).h,
      child: TextField(
        cursorColor: AppColor.mainColor,
        controller: controller,
        keyboardType: keybardType,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
        ),
      ),
    );
  }
}
