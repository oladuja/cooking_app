import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/providers/recipes.dart';
import 'package:cooking_app/screens/home/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_color.dart';
import '../../widgets/recommended_item.dart';
import '../../widgets/search_and_filter_button.dart';
import 'detail_screen.dart';
import 'notifications_screen.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const String routeName = 'recently-viewed-screen';

  const RecentlyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Recipes recipes = Provider.of<Recipes>(context)
      ..generateRecentlyViewedList();
    print(recipes.recentlyViewedRecipeList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                'assets/images/menu.png',
                width: 21.w,
                height: 16.h,
              ),
            ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(NotificationScreen.routeName),
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      drawer: const SideMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Viewed',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      recipes.clearViewedList();
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SearchAndFilterButton(
                hintText: 'Search using keywords',
                onTap: () {},
              ),
              SizedBox(height: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List<Widget>.generate(
                    recipes.recentlyViewedRecipeList.length,
                    (index) {
                      List<Recipe> recipeItem =
                          recipes.recentlyViewedRecipeList;
                      return RecommendedItem(
                        recipe: recipeItem[index],
                        onTap: () =>
                            recipes.favourite(recipeItem[index].foodName),
                        gestureTapDetector: () {
                          Navigator.of(context).pushNamed(
                              DetailScreen.routeName,
                              arguments: recipeItem[index]);
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
