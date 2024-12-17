import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleRecipeModel {
  final String image;
  final String intgredients;
  final double height;

  SimpleRecipeModel({
    required this.image,
    required this.intgredients,
    required this.height,
  });
}

// .75,1.75,1.95,1.22,1.8,1.89
List<SimpleRecipeModel> recipes = [
  SimpleRecipeModel(
    image: "assets/food/berry_chia_smoothie.jpg",
    intgredients: "assets/food/berry_chia_smoothie_ing.jpg",
    height: .6.h,
  ),
  SimpleRecipeModel(
    image: "assets/food/Chicken_garam_masala.jpg",
    intgredients: 'assets/food/Chicken_garam_masala_ing.jpg',
    height: 1.35.h,
  ),
  SimpleRecipeModel(
    image: "assets/food/Meatless_Monday Stir.jpg",
    intgredients: 'assets/food/Meatless_Monday Stir_ing.jpg',
    height: 1.5.h,
  ),
  SimpleRecipeModel(
    image: "assets/food/Protein_Crepes.jpg",
    intgredients: 'assets/food/Protein_Crepes_Ing.jpg',
    height: .98.h,
  ),
  SimpleRecipeModel(
    image: "assets/food/roasted_Spicy_Edamame.jpg",
    intgredients: 'assets/food/roasted_Spicy_Edamame_ing.jpg',
    height: 1.4.h,
  ),
  SimpleRecipeModel(
    image: "assets/food/sheet_pan.jpg",
    intgredients: 'assets/food/sheet_pan_ing.jpg',
    height: 1.45.h,
  ),
];
