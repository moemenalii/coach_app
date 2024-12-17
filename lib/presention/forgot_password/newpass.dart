import 'package:flutter/material.dart';
import 'package:healthystate/presention/forgot_password/verification.dart';
import '../../components_tools.dart';
import '../resources/color_manager.dart';

class Newpass extends StatelessWidget {
  const Newpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final TextEditingController newpasswordController = TextEditingController();
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
                'Entre Your Password ',
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
              const Image(image: AssetImage('assets/images/newpass.png')),
              const SizedBox(
                height: 20,
              ),
              defultTextForm(
                controller: newpasswordController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.password),
                label: 'Enter New Password',
                onTab: () {},
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'please Enter your Password ';
                  }
                },
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
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Verfy()));
                  },
                  child: const Text(
                    'send',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
