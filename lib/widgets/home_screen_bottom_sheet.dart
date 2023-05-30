import 'package:cooking_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/style.dart';
import '../helpers/app_color.dart';
import '../models/course.dart';
import '../models/meal.dart';
import 'custom_slider.dart';
import 'filter_item.dart';

class HomeScreenBottomSheet extends StatefulWidget {
  const HomeScreenBottomSheet({
    super.key,
  });

  @override
  State<HomeScreenBottomSheet> createState() => _HomeScreenBottomSheetState();
}

class _HomeScreenBottomSheetState extends State<HomeScreenBottomSheet> {
  int filterCurrentIndex = -1;
  int courseCurrentIndex = -1;

  RangeValues servingValues = const RangeValues(1, 10);
  RangeValues preparationValues = const RangeValues(5, 60);
  RangeValues caloriesValues = const RangeValues(0, 1000);

  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      width: 1.sw,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                'Filter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                'reset',
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'Meal',
            style: Style.filterTextStyle,
          ),
          SizedBox(height: 8.h),
          GridView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 12,
              childAspectRatio: 3,
            ),
            padding: EdgeInsets.zero,
            children: List<Widget>.generate(
              meals.length,
              (index) => FilterItem(
                meal: meals[index],
                isActive: index == filterCurrentIndex,
                onTap: () {
                  setState(() {
                    filterCurrentIndex = index;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8).h,
            child: const Divider(color: AppColor.lightTextColor),
          ),
          Text(
            'Course',
            style: Style.filterTextStyle,
          ),
          SizedBox(height: 8.h),
          GridView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 12,
              childAspectRatio: 3,
            ),
            padding: EdgeInsets.zero,
            children: List<Widget>.generate(
              course.length,
              (index) => FilterItem(
                meal: course[index],
                isActive: index == courseCurrentIndex,
                onTap: () {
                  setState(() {
                    courseCurrentIndex = index;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8).h,
            child: const Divider(
              color: AppColor.lightTextColor,
            ),
          ),
          CustomSlider(
            servingValues: servingValues,
            min: 1,
            max: 10,
            name: 'Serving',
            onChanged: (value) {
              setState(() {
                servingValues = RangeValues(
                  value.start.floorToDouble(),
                  value.end.floorToDouble(),
                );
              });
            },
          ),
          CustomSlider(
            servingValues: preparationValues,
            min: 5,
            max: 60,
            name: 'Preparation Time',
            onChanged: (value) {
              setState(() {
                preparationValues = RangeValues(
                  value.start.floorToDouble(),
                  value.end.floorToDouble(),
                );
              });
            },
          ),
          CustomSlider(
            servingValues: caloriesValues,
            min: 0,
            max: 1000,
            name: 'Calories',
            onChanged: (value) {
              setState(() {
                caloriesValues = RangeValues(
                  value.start.floorToDouble(),
                  value.end.floorToDouble(),
                );
              });
            },
          ),
          Text(
            'Rating',
            style: Style.filterTextStyle,
          ),
          RatingBar.builder(
            itemSize: 24.0,
            initialRating: rating,
            itemBuilder: (_, i) => const Icon(
              Icons.star,
              color: AppColor.mainColor,
            ),
            unratedColor: Colors.grey,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            onRatingUpdate: (stars) {
              setState(() {
                rating = stars;
              });
            },
          ),
          SizedBox(height: 8.h),
          AppButton(
            title: 'Apply',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
