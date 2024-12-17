// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/resources/color_manager.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

import 'package:numberpicker/numberpicker.dart';

class Olduser extends StatefulWidget {
  const Olduser({super.key});

  @override
  _Olduser createState() => _Olduser();
}

class _Olduser extends State<Olduser> {
  // int _currentValue = 3;
  int integerValue = 20;
  // double decimalValue = 0;

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "How old Are you ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              // Text(integerValue.toString()),
            ],
          ),
          SizedBox(
            height: 410,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: NumberPicker(
                      minValue: 10,
                      maxValue: 99,
                      value: integerValue,
                      selectedTextStyle: const TextStyle(
                          color: Color.fromARGB(255, 46, 190, 82),
                          fontSize: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      onChanged: (value) {
                        setState(() {
                          integerValue = value;
                          context.read<AppCubit>().old = integerValue;
                        });
                      }),
                ),
              ],
            ),
          ),

          ElevatedButton(
              child: Text('Submit',
                  style: TextStyle(
                    color: ColorManager.primary,
                  )),
              onPressed: () {
                context.read<AppCubit>().old = integerValue;
                print(integerValue);
                Navigator.pushReplacementNamed(context, Routes.startRoute);
              }) // Row(
        ],
      ),
    );
  }
}
