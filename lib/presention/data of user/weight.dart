
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

import '../resources/color_manager.dart';

class WeightUser extends StatefulWidget {
  const WeightUser({super.key});

  @override
  State<WeightUser> createState() => _WeightUserState();
}

class _WeightUserState extends State<WeightUser> {
  final double min = 0;
  final double max = 150;
  String selectedWieght = '50';

  @override
  // void initState() {
  //   selectedWieght = min.toString();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        // title: const Text('Animated Weight Picker'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 150,
          ),
          const Text(
            'What\'s your weight?',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 500,
            child: AnimatedWeightPicker(
              min: 50,
              max: 150,
              onChange: (newValue) {
                setState(() {
                  selectedWieght = newValue;
                  context.read<AppCubit>().weight = selectedWieght;
                });
              },
            ),
          ),

          const SizedBox(height: 190),
          // Text(
          //   'Selected Value: $selectedValue',
          //   style: const TextStyle(fontSize: 20),
          // ),
          // const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<AppCubit>().weight = selectedWieght;
              print('Selected Weight: $selectedWieght');
              Navigator.pushNamed(context, Routes.OlduserRoute);
            },
            child: Text('Next',
                style: TextStyle(
                  color: ColorManager.primary,
                )),
          ),
        ],
      ),
    );
  }
}
