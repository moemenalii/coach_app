import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthystate/presention/resources/constant.dart';
import 'package:healthystate/presention/resources/assets_manager.dart';
import 'package:healthystate/presention/resources/color_manager.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        // SvgPicture.asset( ImagesAssets.SplashLogo,)
        // Image(image: AssetImage(ImagesAssets.SplashLogo2))
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white38,
              Colors.grey,
            ]),
          ),
          child: const Center(
            child: Image(image: AssetImage(ImagesAssets.SplashLogo2)),
          ),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
