import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/cubit/cubit.dart';
import 'ex_model.dart';

// Add this line to import the 'lottie' package

class ExPrivate extends StatefulWidget {
  const ExPrivate({Key? key}) : super(key: key);

  @override
  State<ExPrivate> createState() => _ExPrivateState();
}
class _ExPrivateState extends State<ExPrivate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/cat1.jpg'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Calisthenics',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      buildItemex(exs[index], context),
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                  itemCount: exs.length),
            )
          ],
        ),
      ),
    );
  }
}
// CONTAINER modell=CONTAINER(images], uniqe);
int timer=30;
Widget buildItemex(ExModel model, context) => GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // if(modelll.uniqe=='1')/

            Lottie.asset(
              model.image,
              height: 90,
            ),
            // Lottie.asset(
            //   model.image,
            //   height: 90,
            // ),
            // if(modelll.uniqe=='2')
            //   Lottie.asset(
            //     model.image2,
            //     height: 90,
            //   ),
              const SizedBox(
              width: 30,
            ),
            // if(model.title=='pushing')

            Text(
              model.title,
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),Text(
              model.body,
              style:  TextStyle(
                  fontSize: 20,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) => SizedBox(
            height: 650,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // image:  DecorationImage(
                        //   image: AssetImage(model.image),
                        //   fit: BoxFit.fill,
                        // ),

                        color: Colors.white),
                    child:   Lottie.asset(
                      model.image,
                      // height: 90,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Duration',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<AppCubit>().countminus();
                              },
                              icon: const Icon(CupertinoIcons.minus_circle)),
                           Text(
                            '00:${ context.read<AppCubit>().counter}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent),
                          ),
                          IconButton(
                              onPressed: () {
                                context.read<AppCubit>().countplus();
                              },
                              icon: const Icon(CupertinoIcons.add_circled)),
                        ],
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Instructor',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                    ],
                  ),
                  const Text(
                    'You should reach the Miami naturally in front of the straight lure a'
                    ' good distance away'
                    ' and then hold the double braided handle'
                    ' holding it steady just as you keep your back arched.',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
        // Navigator.pushNamed(context,
        //     Routes.itemExRoute); // bottomSheet:  InteractiveBottomSheet(
      },
    );
