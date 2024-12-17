import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/simple_recipe_model.dart';

class Intgredients extends StatelessWidget {
  const Intgredients({
    super.key,
    required this.recipe,
  });
  final SimpleRecipeModel recipe;
  @override
  Widget build(BuildContext context) {
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.only(left: 20, top: 30),
              height: 366.h,
              width: weight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(recipe.image), fit: BoxFit.fill)),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            Container(
              // padding: const EdgeInsets.only(left: 20, top: 30),
              height: height * recipe.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(recipe.intgredients),
                      fit: BoxFit.fill)),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     recipe.steps!,
            //     style: const TextStyle(fontSize: 19),
            //   ),
            // ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
