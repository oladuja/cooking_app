import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/style.dart';
import '../helpers/app_color.dart';

class CustomSlider extends StatelessWidget {
  final RangeValues servingValues;
  final String name;
  final void Function(RangeValues)? onChanged;
  final double max;
  final double min;

  const CustomSlider({
    super.key,
    required this.servingValues,
    required this.name,
    required this.onChanged,
    required this.max,
    required this.min,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Style.filterTextStyle,
            ),
            Text(
              'set manually',
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: RangeSlider(
            values: servingValues,
            labels: RangeLabels(
              servingValues.start.toString(),
              servingValues.end.toString(),
            ),
            min: min,
            max: max,
            activeColor: AppColor.mainColor,
            inactiveColor: AppColor.containerColor,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
