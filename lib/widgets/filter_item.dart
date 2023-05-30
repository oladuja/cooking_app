import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_color.dart';

class FilterItem extends StatelessWidget {
  final String meal;

  final void Function()? onTap;
  final bool isActive;

  const FilterItem({
    super.key,
    required this.meal,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? AppColor.mainColor.withOpacity(0.2)
              : AppColor.itemColor,
          border: isActive
              ? Border.all(
                  color: AppColor.mainColor,
                  width: 1,
                )
              : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            meal,
            style: TextStyle(
              color: isActive ? AppColor.mainColor : AppColor.darkTextColor,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
