class Recipe {
  final String image;
  final String type;
  final String foodName;
  final double rating;
  final int calories;
  final int cookingTime;
  final int serving;
  bool isFavourite;
  bool isVIewed;

  Recipe({
    required this.type,
    required this.image,
    required this.foodName,
    required this.rating,
    required this.calories,
    required this.cookingTime,
    required this.serving,
    this.isFavourite = false,
    this.isVIewed = false,
  });
}
