import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/core/cubit/state.dart';
import 'food_model.dart'; // Import your FoodModel class

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AppCubit>().getFood();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List'),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is GetFoodSuccess) {
            // Assuming state.foodList is a List<FoodModel>
            List foodModels = state.foodList;
            // Assuming we want to display the first Data item of each FoodModel
            // Adjust this logic based on your actual data structure and requirements
            return ListView.builder(
              itemCount: foodModels.length,
              itemBuilder: (context, index) {
                final food =
                    foodModels[index].data?.first; // Access the first Data item
                if (food != null) {
                  return ListTile(
                    // Uncomment and fix the line below according to your actual data structure
                    // leading: Image.network(food.icon ?? '', width: 50, height: 50),
                    title: Text(
                        food.name ?? ''), // Now correctly accessing Data's name
                    subtitle: Text(
                        'Calories: ${food.cals ?? 0}, Protein: ${food.protein ?? 0}g, Carbs: ${food.carb ?? 0}g, Fat: ${food.fat ?? 0}g'),
                  );
                } else {
                  return const ListTile(
                    title: Text('No data available'),
                  );
                }
              },
            );
          } else if (state is GetFoodFailure) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
