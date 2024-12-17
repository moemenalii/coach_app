import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/simple_recipes.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/text_custom.dart';

class ListOfFood extends StatelessWidget {
  const ListOfFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextCustom(
                        text: 'Breakfast',
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('See All')),
                    ]),
              ),
              const SimpleRecipes(),
              SizedBox(
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextCustom(
                        text: 'Lunch',
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('See All')),
                    ]),
              ),
              const SimpleRecipes(),
              SizedBox(
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextCustom(
                        text: 'Dinner',
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('See All')),
                    ]),
              ),
              const SimpleRecipes(),
              SizedBox(
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextCustom(
                        text: 'Snacks',
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('See All')),
                    ]),
              ),
              const SimpleRecipes(),
            ],
          ),
        ));
  }
}

// class ListOfFood extends StatelessWidget {
//   const ListOfFood({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: const CupertinoNavigationBar(),
//         body: SingleChildScrollView(
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 40,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const TextCustom(
//                         text: 'Breakfast',
//                       ),
//                       TextButton(
//                           onPressed: () {}, child: const Text('See All')),
//                     ]),
//               ),
//               const FoodList(),
//               SizedBox(
//                 height: 40,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const TextCustom(
//                         text: 'Lunch',
//                       ),
//                       TextButton(
//                           onPressed: () {}, child: const Text('See All')),
//                     ]),
//               ),
//               const FoodList(),
//               SizedBox(
//                 height: 40,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const TextCustom(
//                         text: 'Dinner',
//                       ),
//                       TextButton(
//                           onPressed: () {}, child: const Text('See All')),
//                     ]),
//               ),
//               const FoodList(),
//               SizedBox(
//                 height: 40,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const TextCustom(
//                         text: 'Snacks',
//                       ),
//                       TextButton(
//                           onPressed: () {}, child: const Text('See All')),
//                     ]),
//               ),
//               const FoodList(),
//             ],
//           ),
//         ));
//   }
// }

