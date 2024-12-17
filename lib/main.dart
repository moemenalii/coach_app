import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthystate/cache_helper.dart';
import 'package:healthystate/core/api/dio_consumer.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(DioConsumer(dio: Dio())),
        child: ScreenUtilInit(
          child: MaterialApp(
            theme: ThemeData(primarySwatch: Colors.green),
            title: 'Health State',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoutes,
            initialRoute: Routes.splashRoute,),
        ));
  }
}
