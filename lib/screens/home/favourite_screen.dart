import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/providers/recipes.dart';
import 'package:cooking_app/screens/home/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/recommended_item.dart';
import '../../widgets/search_and_filter_button.dart';
import 'detail_screen.dart';
import 'notifications_screen.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routeName = 'favourite-screen';

  const FavouriteScreen({super.key});

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
              Text(
                'Favourite',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
              SearchAndFilterButton(
                hintText: 'Search using keywords',
                onTap: () {},
              ),
              SizedBox(height: 15.h),
              Consumer<Recipes>(
                builder: (context, recipes, child) {
                  recipes.generateFavouriteList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List<Widget>.generate(
                        recipes.favouriteRecipeList.length,
                        (index) {
                          List<Recipe> recipeItem = recipes.favouriteRecipeList;
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
