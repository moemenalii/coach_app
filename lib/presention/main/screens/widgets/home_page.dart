// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthystate/core/cubit/state.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/model_diets.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/simple_recipes.dart';
import 'package:healthystate/presention/main/screens/widgets/custom_search_delegate.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.diet,
  });
  Diets diet;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double calculateBudget() {
    // print(context.read<AppCubit>().index);
    // double weight = 125;
    // int height = 124;
    // int age = 30;
    double weight = double.parse(context.read<AppCubit>().weight);
    int height = context.read<AppCubit>().hight;
    int age = context.read<AppCubit>().old;
    int gend = 5;
    String gender = context
        .read<AppCubit>()
        .gender; // Assign an initial value to the 'gender' variable
    if (gender == "Male") {
      gend = 5;
    } else {
      gend = -161;
    }
    return 1.4 *
        ((10 * weight) +
            (6.25 * height.toDouble()) -
            (5 * age.toDouble() + gend));
  }

  @override
  Widget build(BuildContext context) {
    late var totalfat = widget.diet.totalFat;
    late var totalprotein = widget.diet.totalProtein;
    late var totalcarb = widget.diet.totalCarb;
    int totalFat = totalfat;
    int totalProtein = totalprotein;
    // Adjusted to include the initial 50g in the total
    int totalCarb = totalcarb;
    Food food = Food(
        lunch: context.read<AppCubit>().sumLunchCals ?? 0,
        breakFast: context.read<AppCubit>().sumBreakFastCals ?? 0,
        dinner: context.read<AppCubit>().sumDinnerCals ?? 0,
        snacks: context.read<AppCubit>().sumSnacksCals ?? 0);

    int totalEat() {
      return food.breakFast + food.lunch + food.dinner + food.snacks;
    }

    int currentCarb = context.read<AppCubit>().sumCarb ?? 0;
    int currentFat = context.read<AppCubit>().sumFat ?? 0;
    int currentProtein = context.read<AppCubit>().sumProtein ?? 0;
    double percentCarb = currentCarb / totalCarb;
    double percentProtein = currentProtein / totalProtein;
    double percentFat = currentFat / totalFat;

    double budget = calculateBudget();

    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.TotalItemFood);
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text('enter your food ')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: 100,
                            // ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.black), // Default text style
                                children: <TextSpan>[
                                  const TextSpan(text: 'calorie budget '),
                                  TextSpan(
                                      text: '${widget.diet.nameDiet} \n',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors
                                              .green)), // Green text style
                                  TextSpan(
                                      text: '       ${budget.round()}',
                                      style: const TextStyle(
                                          color: Colors
                                              .green)), // Green text style
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 90,
                                    lineWidth: 12,
                                    percent: totalEat() < budget.round()
                                        ? totalEat() / budget.round()
                                        : 1.0,
                                    center: RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors
                                                .green), // Default text style
                                        children: <TextSpan>[
                                          TextSpan(text: '${totalEat()}\n '),
                                          totalEat() < budget.round()
                                              ? const TextSpan(
                                                  text: 'left\n',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black))
                                              : const TextSpan(
                                                  text: 'over\n',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black)),
                                          totalEat() > budget.round()
                                              ? TextSpan(
                                                  text:
                                                      '${totalEat() - budget.round()}',
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.grey))
                                              : TextSpan(
                                                  text:
                                                      '${budget.round() - totalEat()}',
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.grey)),
                                          // Green text style
                                        ],
                                      ),
                                    ),
                                    progressColor: Colors.green,
                                    animation: true,
                                    animationDuration: 1100,
                                    circularStrokeCap: CircularStrokeCap.round,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(
                                        name: Name4Food.breakfast,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'breakFast',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                Text(
                                  "${food.breakFast}",
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.green),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(
                                          name: Name4Food.lunch),
                                    );
                                  },
                                  child: const Text(
                                    'lunch',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${food.lunch}",
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.green),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(
                                          name: Name4Food.dinner),
                                    );
                                  },
                                  child: const Text(
                                    'Dinner',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${food.dinner}",
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.green),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(
                                          name: Name4Food.snack),
                                    );
                                  },
                                  child: const Text(
                                    'Snacks',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                Text(
                                  "${food.snacks}",
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // Define the variables

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("Carbs   "),
                                      Text(currentCarb > totalCarb
                                          ? "${(percentCarb * 100 - 100).round()}%"
                                          : "${(percentCarb * 100).round()}%"), // Display percentage with one decimal place
                                    ],
                                  ),
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 1000,
                                    width: 120.w,
                                    lineHeight: 8,
                                    percent: math.min(percentCarb,
                                        1.0), // Use the calculated percent directly as it's already a value between 0 and 1
                                    progressColor: Colors.green,
                                  ),
                                  Row(
                                    children: [
                                      Text("${currentCarb}g     "),
                                      currentCarb > totalCarb
                                          ? Text(
                                              "over ${currentCarb - totalCarb}g")
                                          : Text(
                                              "left ${totalCarb - currentCarb}g"),
                                    ],
                                  ),
                                ],
                              ),
                              // Define the variables

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("Protein   "),
                                      Text(currentProtein > totalProtein
                                          ? "${(percentProtein * 100 - 100).round()}%"
                                          : "${(percentProtein * 100).round()}%"), // Display percentage with one decimal place
                                    ],
                                  ),
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 1000,
                                    width: 120.w,
                                    lineHeight: 8,
                                    percent: math.min(
                                        1.0, math.max(0.0, percentProtein)),
                                    progressColor: Colors.green,
                                  ),
                                  Row(
                                    children: [
                                      Text("${currentProtein}g     "),
                                      currentProtein > totalProtein
                                          ? Text(
                                              "over ${currentProtein - totalProtein}g")
                                          : Text(
                                              "left ${totalProtein - currentProtein}g"),
                                    ],
                                  ),
                                ],
                              ),
                              // Define the variables

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("Fat   "),
                                      Text(currentFat > totalFat
                                          ? "${(percentFat * 100 - 100).round()}%"
                                          : "${(percentFat * 100).round()}%"), // Display percentage with one decimal place
                                      // Display percentage with one decimal place
                                    ],
                                  ),
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 1000,
                                    width: 120.w,
                                    lineHeight: 8,
                                    percent: math.min(percentFat,
                                        1.0), // Use the calculated percent directly as it's already a value between 0 and 1
                                    progressColor: Colors.green,
                                  ),
                                  Row(
                                    children: [
                                      Text("${currentFat}g     "),
                                      currentFat > totalFat
                                          ? Text(
                                              "over ${currentFat - totalFat}g")
                                          : Text(
                                              "left ${totalFat - currentFat}g"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SimpleRecipes()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Food {
  final int lunch;
  final int breakFast;
  final int dinner;
  final int snacks;

  Food(
      {required this.lunch,
      required this.breakFast,
      required this.dinner,
      required this.snacks});
}
