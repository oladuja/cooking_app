import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_color.dart';

class SideMenuDrawerItem extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  const SideMenuDrawerItem({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20).h,
        child: Row(
          children: [
            Container(
              height: 17.h,
              width: 5.w,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.mainColor : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2.0),
                  bottomRight: Radius.circular(2.0),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Image.asset(
              image,
              color: isSelected ? AppColor.mainColor : AppColor.lightTextColor,
              width: 15.w,
              height: 15.h,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? AppColor.mainColor : AppColor.lightTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
