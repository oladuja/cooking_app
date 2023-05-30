import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_color.dart';

class SearchAndFilterButton extends StatelessWidget {
  final String hintText;

  final void Function()? onTap;

  const SearchAndFilterButton({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            height: 48.0.h,
            child: TextField(
              cursorColor: AppColor.mainColor,
              decoration: InputDecoration(
                fillColor: AppColor.containerColor,
                filled: true,
                isDense: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColor.lightTextColor,
                  fontSize: 12.sp,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColor.lightTextColor,
                  size: 24.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 48.w,
            height: 48.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColor.containerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0).w,
              child: Image.asset(
                'assets/images/filter.png',
              ),
            ),
          ),
        )
      ],
    );
  }
}
