import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/resources/constant.dart';
import 'package:healthystate/presention/resources/assets_manager.dart';
import 'package:healthystate/presention/resources/color_manager.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.loading), _goNext);
  }

  _goNext() {
    context.read<AppCubit>().currentPage = 0;
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
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
              Colors.green,
              Colors.grey,
            ]),
          ),
          child: Center(
            child: Lottie.asset("assets/images/lotte33.json"),
          ),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
