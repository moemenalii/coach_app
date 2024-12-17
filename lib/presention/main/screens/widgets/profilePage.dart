import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/cache_helper.dart';
import 'package:healthystate/core/api/end_ponits.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/core/cubit/state.dart';
import 'package:healthystate/presention/resources/color_manager.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';
import 'package:pretty_animated_buttons/widgets/pretty_neumorphic_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SettingPage(
              name: context.read<AppCubit>().name ?? "your name",
              email: "sada",
              profilePic: context.read<AppCubit>().image ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCHU5JIkqfD2z1KMc4c1nW4zdArnxBM3cCcQ&s");
        },
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  final String name;
  final String email;
  final String profilePic;

  const SettingPage({
    super.key,
    required this.name,
    required this.email,
    required this.profilePic,
  });
  @override
  Widget build(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: Colors.white,
            margin: const EdgeInsetsDirectional.all(13.0),
            child: SizedBox(
              height: 210,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(profilePic),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.green),
                    ),
                    // Text('E_mail : moemmen ali @yahoo.com'),
                    // Text('Hieght : 177 cm'),
                    // Text('Weight : 85 kg'),
                  ],
                ),
              ),
            ),
          ),
          Card(
              color: Colors.white,
              margin: const EdgeInsetsDirectional.all(13.0),
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              color: ColorManager.primary,
                              icon: const Icon(Icons.edit_attributes_outlined)),
                          const SizedBox(
                            width: 20,
                          ),
                          PrettyNeumorphicButton(
                            duration: const Duration(milliseconds: 20),
                            label: 'Edit info',
                            onPressed: () {
                              // Navigator.pushNamed(context, routes.adminRoute);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              color: ColorManager.orange,
                              icon: const Icon(CupertinoIcons
                                  .person_crop_circle_badge_plus)),
                          const SizedBox(
                            width: 20,
                          ),
                          PrettyNeumorphicButton(
                            duration: const Duration(milliseconds: 20),
                            label: 'Sign in ',
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.loginRoute);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              color: ColorManager.orange,
                              icon: const Icon(CupertinoIcons.phone_circle)),
                          const SizedBox(
                            width: 20,
                          ),
                          PrettyNeumorphicButton(
                            duration: const Duration(milliseconds: 20),
                            label: 'call center',
                            onPressed: () {
                              BottomSheet(
                                onClosing: () => {},
                                builder: (context) => const Column(
                                  children: [
                                    Row(
                                      children: [Text('01205193855')],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              iconSize: 40,
                              color: ColorManager.orange,
                              icon: const Icon(
                                  CupertinoIcons.arrow_turn_up_right)),
                          const SizedBox(
                            width: 20,
                          ),
                          PrettyNeumorphicButton(
                            duration: const Duration(milliseconds: 20),
                            label: 'logOut',
                            onPressed: () {
                              CacheHelper().removeData(key: ApiKey.token);
                              CacheHelper().removeData(key: ApiKey.userId);
                              CacheHelper().removeData(key: "index");

                              context.read<AppCubit>().deleteitem();
                              context.read<AppCubit>().name = null;
                              context.read<AppCubit>().image = null;
                              context.read<AppCubit>().index = 0;

                              // context.read<AppCubit>().getUser();

                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.startRoute, (route) => false);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
