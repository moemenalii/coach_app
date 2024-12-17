import 'package:flutter/cupertino.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/simple_recipe_model.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

class SimpleRecipes extends StatelessWidget {
  const SimpleRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipes.length,
          itemBuilder: (context, index) => FoodImage(
            recipe: recipes[index],
          ),
        ),
      ),
    );
  }
}

class FoodImage extends StatelessWidget {
  const FoodImage({
    super.key,
    required this.recipe,
  });
  final SimpleRecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.intgredients,
          arguments: recipe,
        );
        // arguments: recipe
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage(recipe.image), fit: BoxFit.fill)),
      ),
    );
  }
}
