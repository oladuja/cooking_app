import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../helpers/app_color.dart';
import '../helpers/password_visibility.dart';

class AppTextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String hintText;

  const AppTextFieldPassword({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    PasswordVisibility passwordVisibility =
        Provider.of<PasswordVisibility>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0).h,
      child: TextField(
                    cursorColor: AppColor.mainColor,

        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: passwordVisibility.visibility,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: IconButton(
            onPressed: () => passwordVisibility.onPressed(),
            icon: Icon(
              passwordVisibility.visibility
                  ? Icons.visibility_off_outlined
                  : Icons.visibility,
              color: Colors.white,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
        ),
      ),
    );
  }
}
