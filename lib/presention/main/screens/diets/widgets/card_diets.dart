import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/model_diets.dart';

class CardDiet extends StatelessWidget {
  const CardDiet({super.key, required this.diet});
  final Diets diet;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              // padding: const EdgeInsets.only(left: 20, top: 30),
              height: 366.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(diet.images), fit: BoxFit.fill)),
            ),
          ],
        ),
        // const Text('Chat',
        //     style: TextStyle(fontSize: 30, color: Colors.black)),
        Container(
          height: 336.h,
          // padding: const EdgeInsets.only(left: 30, top: 30),
          margin: const EdgeInsets.only(left: 30, top: 30),
          // alignment: Alignment.topLeft,
          // height: 400.h,
          // width: 336.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // textAlign: TextAlign.start,
                diet.nameDiet,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 33.0),
              ),
              Text(
                // textAlign: TextAlign.start,
                'View Diet >',
                style: TextStyle(
                    color: diet.nameDiet == "Low-Carb"
                        ? const Color(0xffDC7700)
                        : const Color(0xffE4FF74),
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0),
              ),
              const Spacer(),
              Text(
                diet.title,
                style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 19.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
