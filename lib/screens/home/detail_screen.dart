import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constant/style.dart';
import '../../helpers/app_color.dart';
import '../../models/recipe.dart';
import '../../providers/recipes.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = 'detail-screen';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Recipe recipe = ModalRoute.of(context)?.settings.arguments as Recipe;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text(
                recipe.type,
                style: TextStyle(
                  color: AppColor.darkBlue,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recipe.foodName,
                    softWrap: true,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('favourite');
                    },
                    child: Consumer<Recipes>(
                      builder: (_, recipes, widget) => GestureDetector(
                        onTap: () => recipes.favourite(recipe.foodName),
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
              Text(
                '${recipe.calories} Calories',
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14.sp,
                ),
              ),
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 15.0,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                      Row(
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
                              fontSize: 14.sp,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Image(
                    image: ResizeImage(
                      AssetImage(recipe.image),
                      height: 162,
                      width: 280,
                    ),
                    alignment: const Alignment(-200, 1),
                  ),
                ],
              ),
              Text(
                'Ingredients',
                style: Style.filterTextStyle,
              ),
              const Text('Blueberry'),
              const Text('Strawberry'),
              const Text('Water'),
              const Text('Eggs'),
              const Text('Butter'),
              const Text('Flour'),
              SizedBox(height: 8.h),
              Text(
                'Directions',
                style: Style.filterTextStyle,
              ),
              SizedBox(height: 6.h),
              ...List<Widget>.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0).h,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 2.5,
                          backgroundColor: AppColor.mainColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut.',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
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
