import 'package:flutter/material.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/card_diets.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/model_diets.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/start_diets.dart';

class DietsPage extends StatelessWidget {
  const DietsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final itemIndex = index + 1; // Move this line here
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: NavCardsDiet(
              diet: diet[itemIndex],
              index: index, // Pass the index here
            ),
          );
        },
        itemCount: diet.length - 1,
      ),
    );
  }
}

class NavCardsDiet extends StatelessWidget {
  const NavCardsDiet({super.key, required this.diet, required this.index});
  final Diets diet;
  final int index; // Add the index field

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Pass both diet and index to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StartDiet(
              diet: diet,
              index: index,
            ),
          ),
        );
        print('index: $index');
      },
      child: CardDiet(diet: diet),
    );
  }
}
