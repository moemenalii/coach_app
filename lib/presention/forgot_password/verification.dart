import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class Verfy extends StatelessWidget {
  const Verfy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              'Verification',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              'Please Enter your code sent to your email',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            )),
            const SizedBox(
              height: 30,
            ),
            const Image(image: AssetImage('assets/images/verfy.png')),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   children: [
            //     defultTextForm(
            //       // controller: EmailController,
            //       keyboardType: TextInputType.number,
            //       onTab: () {},
            //       ), defultTextForm(
            //       // controller: EmailController,
            //       keyboardType: TextInputType.number,
            //       onTab: () {},
            //       ), defultTextForm(
            //       // controller: EmailController,
            //       keyboardType: TextInputType.number,
            //       onTab: () {},
            //       ), defultTextForm(
            //       // controller: EmailController,
            //       keyboardType: TextInputType.number,
            //       onTab: () {},
            //       ),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Diden\'t get code ? ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Resend ',
                  style: TextStyle(fontSize: 15, color: ColorManager.primary),
                ),
                //     defultButton(label: 'Send', onPressed: (){}),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadiusDirectional.circular(20)),
              child: TextButton(
                  child: const Text(
                    'verfiy',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.newpassRoute);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
