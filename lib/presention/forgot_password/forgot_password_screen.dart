// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:healthystate/presention/resources/color_manager.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

import '../../components_tools.dart';

// ignore: must_be_immutable
class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});
  var EmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Forgot Your Password ?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Enter your registered email below to receive password reset instruction',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
              const Image(
                  image: AssetImage('assets/images/forgotpassword.png')),
              const SizedBox(
                height: 20,
              ),
              defultTextForm(
                controller: EmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail),
                label: 'Enter E-mail or Phone Number',
                onTab: () {},
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'please Enter your email ';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Remember password ? ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Login ',
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
                      'send',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.verfyRoute);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
