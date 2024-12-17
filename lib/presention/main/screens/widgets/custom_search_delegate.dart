import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/main/screens/widgets/model_meal.dart';

class CustomSearchDelegate extends SearchDelegate<Meal> {
  final String? name;
  // List of Meals instead of Strings

  CustomSearchDelegate(
      {super.searchFieldLabel,
      super.searchFieldStyle,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      this.name});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Meal> searchResults = searchList
        .where((meal) => meal.slug.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].slug),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Meal> suggestionList = query.isEmpty
        ? []
        : searchList
            .where(
                (meal) => meal.slug.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.green[300],
            child: ListTile(
              leading: Image.network(suggestionList[index].icon,
                  width: 50, height: 50),
              title: Text(suggestionList[index].slug),
              trailing: Text('Cals: ${suggestionList[index].cals}'),
              onTap: () {
                context.read<AppCubit>().totalItem.add(suggestionList[index]);

                // print("Calories: ${suggestionList[index].cals}");
                if (name == "Breakfast") {
                  context
                      .read<AppCubit>()
                      .totalBreakFastCals
                      .add(suggestionList[index].cals);

                  // Add the calories to the sumBreakFastCals
                  context.read<AppCubit>().sumBreakFastCals = context
                      .read<AppCubit>()
                      .totalBreakFastCals
                      .reduce((a, b) => a + b);

                  print(
                      "sumBreakFastCals: ${context.read<AppCubit>().sumBreakFastCals}");
                } else if (name == "Lunch") {
                  context
                      .read<AppCubit>()
                      .totalLunchCals
                      .add(suggestionList[index].cals);
                  // Add the calories to the sumLunchCals
                  context.read<AppCubit>().sumLunchCals = context
                      .read<AppCubit>()
                      .totalLunchCals
                      .reduce((a, b) => a + b);
                  print(
                      "sumLunchCals: ${context.read<AppCubit>().sumLunchCals}");
                } else if (name == "Dinner") {
                  context
                      .read<AppCubit>()
                      .totalDinnerCals
                      .add(suggestionList[index].cals);
                  // Add the calories to the sumDinnerCals
                  context.read<AppCubit>().sumDinnerCals = context
                      .read<AppCubit>()
                      .totalDinnerCals
                      .reduce((a, b) => a + b);
                  print(
                      "sumDinnerCals: ${context.read<AppCubit>().sumDinnerCals}");
                } else if (name == "Snack") {
                  context
                      .read<AppCubit>()
                      .totalSnacksCals
                      .add(suggestionList[index].cals);
                  // Add the calories to the sumSnacksCals
                  context.read<AppCubit>().sumSnacksCals = context
                      .read<AppCubit>()
                      .totalSnacksCals
                      .reduce((a, b) => a + b);
                  print(
                      "sumSnacksCals: ${context.read<AppCubit>().sumSnacksCals}");
                }

                if (name == Name4Food.breakfast ||
                    name == Name4Food.lunch ||
                    name == Name4Food.snack ||
                    name == Name4Food.dinner) {
                  context
                      .read<AppCubit>()
                      .totalCarb
                      .add(suggestionList[index].carb);
                  // Add the calories to the sumSnacksCals
                  context.read<AppCubit>().sumCarb = context
                      .read<AppCubit>()
                      .totalCarb
                      .reduce((a, b) => a + b);

                  //
                  //
                  context
                      .read<AppCubit>()
                      .totalFat
                      .add(suggestionList[index].fat);
                  // Add the calories to the sumSnacksCals
                  context.read<AppCubit>().sumFat =
                      context.read<AppCubit>().totalFat.reduce((a, b) => a + b);
                  //
                  //
                  context
                      .read<AppCubit>()
                      .totalProtein
                      .add(suggestionList[index].protein);
                  // Add the calories to the sumSnacksCals
                  context.read<AppCubit>().sumProtein = context
                      .read<AppCubit>()
                      .totalProtein
                      .reduce((a, b) => a + b);
                }

                context.read<AppCubit>().ontapitem();
              },
            ),
          ),
        );
      },
    );
  }
}

class Name4Food {
  static const String breakfast = "Breakfast";
  static const String lunch = "Lunch";
  static const String dinner = "Dinner";
  static const String snack = "Snack";
}
