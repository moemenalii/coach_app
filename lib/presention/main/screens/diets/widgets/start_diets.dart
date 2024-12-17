import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/cache_helper.dart';
import 'package:healthystate/presention/main/screens/dashboard.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/card_diets.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/check_text.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/model_diets.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/simple_recipes.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/sized_text.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/core/cubit/state.dart';
import 'package:healthystate/presention/resources/color_manager.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

class StartDiet extends StatelessWidget {
  const StartDiet({super.key, required this.diet, required this.index});
  final Diets diet;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDiet(diet: diet),
                const SizedBox(height: 20),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          foregroundImage:
                              AssetImage('assets/images/coach.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Health State Dietitian ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                            Text(
                              'Ahmed katheer',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            Text(
                              'mS.RD.bC-ADE.ACE-PT.CDE',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                            Text(
                              'Don’t shortchange yourself on protein\n in order to save calories,Boosting your\n protein helps you feel full and maintain\n muscle mass as you lose weight,',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'How it Works',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'High-protein plans support weight loss by keeping you full longer and preventing loss of calorie-burning muscle mass, Personalize your protein target based on your body weight and nutrition goals, it’s a good fit for athletes and people looking to build muscle mass, Choose animal-and plant-based protein sources along with healthy carbs and fats.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Text(
                    'Highlights',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                const CheckText(
                    text:
                        ' Protein-rich foods keep you full longer\n and reduce hunger,making it easier to\n stick to your weight loss plan'),
                const CheckText(
                  text:
                      ' Helps prevent muscle loss accompanying\n weight loss, maintaining a higher\n metabolic rate',
                ),
                const CheckText(
                  text:
                      ' Enjoy flavorful and filling protein-rich\n foods and recipes',
                ),
                const CheckText(
                  text:
                      ' Perfect for athletes-get strong and\n energized with high-quality carbs and\n healthy fats',
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: SizedText(
                    text: 'Sample Recipes',
                  ),
                ),
                const SimpleRecipes(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.ListOfFood);
                    },
                    child: const Text("More Recipes")),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: SizedText(
                    text: 'Includes',
                  ),
                ),
                const CheckText(
                  text:
                      ' Planning protein target, selecting your\n macros and planning your diet',
                ),
                const CheckText(
                  text: ' Personalized vitamin, and mineral targets',
                ),
                const CheckText(
                  text: ' AutoPilot to guide your weight loss',
                ),
                const CheckText(
                  text:
                      ' Advice and feedback tailored for high-\n protein lifestyle',
                ),
                const CheckText(
                  text: ' Easy and delicious high-protein recipes',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: Image.asset('assets/images/error.png')),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Text(
                      "If you have a chronic health condition, including kidney disease or liver disease, consult your healthcare provider before starting a high-protein diet plan."),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Assuming saveDietChanges is an asynchronous function that saves the changes
                      // await saveDietChanges(diet);
                      // After saving, navigate to the HomePage

                      context.read<AppCubit>().index = index + 1;
                      context.read<AppCubit>().currentPage = 0;

                      print('index: $index');

                      CacheHelper().saveData(key: "index", value: index);
                      print(CacheHelper().getData(key: "index"));
                      CacheHelper().saveData(key: "diet", value: diet);
                      Navigator.pushNamed(context, Routes.LoadingView);
                      // Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Start Diet Plan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
