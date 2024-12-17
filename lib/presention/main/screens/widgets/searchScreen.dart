// ignore_for_file: camel_case_types

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healthystate/presention/main/screens/widgets/search_model.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController TextSearch = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.sports_gymnastics),
                onPressed: () {},
              ),
            ],
          ),
          title: const Text('Health State'),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/images/health.png',
                height: 50,
                width: 80,
              ),
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onTap: () {},
              // validator: validate,
              controller: TextSearch,
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                // for(value in food[index].compareTo(TextSearch as String)
                // );
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                label: const Text('Search'),
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                hintText: 'Entre your food',
                hintStyle: const TextStyle(backgroundColor: Colors.white10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
          ),
          Expanded(
            child: ConditionalBuilder(
              condition: true,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildsearchitem(meals[index]),
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                  itemCount: meals.length),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          )
        ],
      ),
    );
  }
}

List<String> food = [
  'eggs',
  'mango',
  'fish',
  'meat',
  'chiken',
];

Widget buildsearchitem(meal model) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Row(
          children: [
            Image(
              image: AssetImage(model.images),
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.nameFood,
                ),
                Text('${model.Protein}'),
              ],
            ),
          ],
        ),
        onTap: () {},
      ),
    );
