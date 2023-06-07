import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_color.dart';

class NotifcationItem extends StatelessWidget {
  final dynamic index;

  const NotifcationItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 10).h,
        padding: const EdgeInsets.all(8).h,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.delete_outline_outlined,
                color: AppColor.darkTextColor,
              ),
              Text(
                'Remove',
                style: TextStyle(
                  color: AppColor.darkTextColor,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
      key: ValueKey(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10).h,
        padding: const EdgeInsets.all(8).h,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColor.containerColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '08 April',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.darkBlue,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consetetur.',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.mainColor,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut.',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
