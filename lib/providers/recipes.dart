import 'package:flutter/material.dart';

import '../models/recipe.dart';

class Recipes extends ChangeNotifier {
  final List<Recipe> _recipesList = [
    Recipe(
      image: 'assets/images/toast.png',
      foodName: 'French Toast with Berries',
      type: 'Breakfast',
      rating: 5,
      calories: 120,
      cookingTime: 10,
      serving: 1,
    ),
    Recipe(
      image: 'assets/images/cinnamontoast.png',
      foodName: 'Brown Sugar Cinnamon Toast',
      type: 'Breakfast',
      rating: 4,
      calories: 135,
      cookingTime: 15,
      serving: 1,
    ),
    Recipe(
      image: 'assets/images/salmon.png',
      foodName: 'Glazed Salmon',
      type: 'Main Dish',
      rating: 4.5,
      calories: 200,
      cookingTime: 45,
      serving: 1,
    ),
  ];

  final List<Recipe> _recomendedList = [
    Recipe(
      image: 'assets/images/muffins.png',
      foodName: 'Blueberry Muffins',
      type: 'Breakfast',
      rating: 3.5,
      calories: 120,
      cookingTime: 10,
      serving: 1,
    ),
    Recipe(
      image: 'assets/images/salmon.png',
      foodName: 'Glazed Salmon',
      type: 'Main Dish',
      rating: 5,
      calories: 289,
      cookingTime: 45,
      serving: 1,
    ),
    Recipe(
      image: 'assets/images/chicken.png',
      foodName: 'Asian Glazed Chicken Thighs',
      type: 'Main Dish',
      rating: 45,
      calories: 200,
      cookingTime: 45,
      serving: 1,
    ),
    Recipe(
      image: 'assets/images/toast.png',
      foodName: 'French Toast with Berries',
      type: 'Breakfast',
      rating: 5,
      calories: 120,
      cookingTime: 10,
      serving: 1,
    ),
    Recipe(
      image: 'assets/images/cinnamontoast.png',
      foodName: 'Brown Sugar Cinnamon Toast',
      type: 'Breakfast',
      rating: 4,
      calories: 135,
      cookingTime: 15,
      serving: 1,
    ),
  ];

  List<Recipe> get recipesList => _recipesList;

  List<Recipe> get recomendedList => _recomendedList;

  void clearViewedList() {
    for (var recipe in _recipesList) {
      recipe.isVIewed = false;
    }

    for (var recipe in _recomendedList) {
      recipe.isVIewed = false;
    }

    notifyListeners();
  }

  void favourite(String name) {
    Recipe recipe = [..._recipesList, ..._recomendedList]
        .firstWhere((recipe) => recipe.foodName == name);

    recipe.isFavourite = !recipe.isFavourite;
    notifyListeners();
  }

  void viewed(String name) {
    Recipe recipe = [..._recipesList, ..._recomendedList]
        .firstWhere((recipe) => recipe.foodName == name);

    recipe.isVIewed = true;
    notifyListeners();
  }

  void recommendedFavourite(String name) {
    Recipe recipe =
        _recomendedList.firstWhere((recipe) => recipe.foodName == name);
    recipe.isFavourite = !recipe.isFavourite;
    notifyListeners();
  }

  List<Recipe> favouriteRecipeList = [];

  List<Recipe> recentlyViewedRecipeList = [];

  void generateFavouriteList() {
    List favouriteRecipes =
        _recipesList.where((recipe) => recipe.isFavourite).toList();
    List favouriteRecommendedRecipes =
        _recomendedList.where((recipe) => recipe.isFavourite).toList();
    favouriteRecipeList = [...favouriteRecipes, ...favouriteRecommendedRecipes];
  }

  void generateRecentlyViewedList() {
    List recentlyViewedRecipes =
        _recipesList.where((recipe) => recipe.isVIewed).toList();
    List recentlyViewedRecommendedRecipes =
        _recomendedList.where((recipe) => recipe.isVIewed).toList();
    recentlyViewedRecipeList = [
      ...recentlyViewedRecipes,
      ...recentlyViewedRecommendedRecipes
    ];
  }
}
