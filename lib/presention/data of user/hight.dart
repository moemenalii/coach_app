// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';
import 'package:numberpicker/numberpicker.dart';

import '../resources/color_manager.dart';

class hightuser extends StatefulWidget {
  const hightuser({super.key});
  @override
  _hightuser createState() => _hightuser();
}

class _hightuser extends State<hightuser> {
  // int _currentValue = 3;
  // int integerValue = 20;
  // double decimalValue = 0;
  int selectedHeightCm = 30;
  int selectedHeightM = 1;
  int hightuser = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     const SizedBox(
          //       width: 50,
          //     ),

          //   ],
          // ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "What's your height  ?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Text(integerValue.toString()),
            ],
          ),

          SizedBox(
            height: 400,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NumberPicker(
                    minValue: 1,
                    maxValue: 2,
                    value: selectedHeightM,
                    selectedTextStyle: const TextStyle(
                        color: Color.fromARGB(255, 46, 190, 82), fontSize: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedHeightM = value;
                      });
                    }),
                const Text(" m", style: TextStyle(fontSize: 25)),
                const SizedBox(width: 20), // Add some space between the pickers
                NumberPicker(
                    minValue: 30,
                    maxValue: 99,
                    value: selectedHeightCm,
                    selectedTextStyle: const TextStyle(
                        color: Color.fromARGB(255, 46, 190, 82), fontSize: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedHeightCm = value;
                      });
                    }),
                const Text(" cm", style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                int hightuser = selectedHeightM * 100 + selectedHeightCm;
                print(hightuser);
                context.read<AppCubit>().hight = hightuser;

                Navigator.pushNamed(context, Routes.weightuserRoute);
              },
              child: Text('Next',
                  style: TextStyle(
                    color: ColorManager.primary,
                  ))),
        ],
      ),
    );
  }
}
