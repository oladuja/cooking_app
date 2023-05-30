import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_color.dart';
import '../../models/recipe.dart';
import '../../providers/recipes.dart';
import '../../widgets/fresh_recipes_item.dart';
import '../../widgets/home_screen_bottom_sheet.dart';
import '../../widgets/recommended_item.dart';
import '../../widgets/search_and_filter_button.dart';
import '../../widgets/see_all_text.dart';
import 'detail_screen.dart';
import 'notifications_screen.dart';
import 'side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              SizedBox(height: 15.h),
              Text(
                'Welcome Back',
                style: TextStyle(
                  color: AppColor.lightTextColor,
                  fontSize: 12.0.sp,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'What would you like to cook\ntoday?',
                style: TextStyle(
                  color: const Color(0XFF1F222B),
                  fontSize: 20.0.sp,
                ),
              ),
              SizedBox(height: 8.h),
              SearchAndFilterButton(
                hintText: 'Search for recipes',
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const SingleChildScrollView(
                    child: HomeScreenBottomSheet(),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              const SeeAllText(text: 'Today\'s Fresh Recipes'),
              SizedBox(height: 8.h),
              Consumer<Recipes>(
                builder: (_, recipes, widget) => SizedBox(
                  height: 225.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recipes.recipesList.length,
                    itemBuilder: (context, index) {
                      Recipe recipe = recipes.recipesList[index];
                      return FreshRecipesItem(
                        recipe: recipe,
                        onTap: () => recipes.favourite(recipe.foodName),
                        gestureTapDetector: () {
                          recipes.viewed(recipe.foodName);
                          Navigator.of(context).pushNamed(
                            DetailScreen.routeName,
                            arguments: recipe,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SeeAllText(text: 'Recommended'),
              Consumer<Recipes>(
                builder: (_, recipes, widget) => ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: recipes.recomendedList.length,
                  itemBuilder: (context, index) {
                    Recipe recipe = recipes.recomendedList[index];
                    return RecommendedItem(
                      recipe: recipe,
                      onTap: () =>
                          recipes.recommendedFavourite(recipe.foodName),
                      gestureTapDetector: () {
                        recipes.viewed(recipe.foodName);
                        Navigator.of(context).pushNamed(
                          DetailScreen.routeName,
                          arguments: recipe,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
