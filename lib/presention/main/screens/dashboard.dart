import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/cache_helper.dart';
import 'package:healthystate/core/api/end_ponits.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/presention/main/screens/widgets/custom_search_delegate.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';
import '../../../core/cubit/state.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context).get(context);
    // var profilePic = CacheHelper().getData(key: ApiKey.profilePic);
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var pages = cubit.getPages(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Row(
              children: [],
            ),
            title: Image.asset(
              'assets/images/logo.png',
              width: 170,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  context.read<AppCubit>().currentPage = 3;

                  Navigator.pushReplacementNamed(context, Routes.mainRoute);
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    context.read<AppCubit>().image ??
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCHU5JIkqfD2z1KMc4c1nW4zdArnxBM3cCcQ&s",
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // IconButton(
              //   icon: const Icon(Icons.more_vert),
              //   onPressed: () {
              //     Navigator.pushNamed(context, Routes.LoadingView);
              //   },
              // ),
            ],
          ),
          body: pages[cubit.currentPage],
          bottomNavigationBar: cubit.bottomNav(),
        );
      },
      listener: (context, state) {},
    );
  }
}
