import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_color.dart';
import '../models/recipe.dart';

class RecommendedItem extends StatelessWidget {
  final Recipe recipe;

  final void Function()? onTap;
  final void Function()? gestureTapDetector;

  const RecommendedItem({
    super.key,
    required this.recipe,
    required this.onTap,
    required this.gestureTapDetector,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureTapDetector,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10).h,
        width: 1.sw,
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColor.containerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: ResizeImage(
                  AssetImage(recipe.image),
                  height: 45,
                  width: 75,
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recipe.type,
                    style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    recipe.foodName,
                    softWrap: true,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        itemSize: 14.0,
                        initialRating: recipe.rating,
                        itemBuilder: (_, i) => const Icon(
                          Icons.star,
                          color: AppColor.mainColor,
                          size: 10,
                        ),
                        unratedColor: Colors.grey,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        onRatingUpdate: (_) {},
                      ),
                      SizedBox(width: 6.h),
                      Text(
                        '${recipe.calories} Calories',
                        style: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Image(
                                image: ResizeImage(
                                  AssetImage('assets/images/time.png'),
                                  height: 9,
                                  width: 9,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                '${recipe.cookingTime} mins',
                                style: TextStyle(
                                  color: AppColor.lightTextColor,
                                  fontSize: 10.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Image(
                                image: ResizeImage(
                                  AssetImage('assets/images/serving.png'),
                                  height: 9,
                                  width: 9,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                '${recipe.serving.toString()} Serving',
                                style: TextStyle(
                                  color: AppColor.lightTextColor,
                                  fontSize: 10.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      (recipe.isFavourite)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: (recipe.isFavourite)
                          ? AppColor.mainColor
                          : AppColor.lightTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
