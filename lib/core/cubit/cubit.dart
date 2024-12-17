import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:healthystate/cache_helper.dart';
import 'package:healthystate/core/api/api_consumer.dart';
import 'package:healthystate/core/api/end_ponits.dart';
import 'package:healthystate/core/errors/exceptions.dart';
import 'package:healthystate/core/functions/upload_image_to_api.dart';
import 'package:healthystate/core/models/sign_in_model.dart';
import 'package:healthystate/core/models/user_model.dart';
import 'package:healthystate/presention/main/screens/diets/food_list_view.dart';
import 'package:healthystate/presention/main/screens/diets/food_model.dart';
import 'package:healthystate/presention/main/screens/diets/widgets/model_diets.dart';
import 'package:healthystate/presention/main/screens/widgets/model_meal.dart';
import 'package:healthystate/presention/main/screens/widgets/search_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../presention/main/screens/widgets/exercises.dart';
import '../../presention/main/screens/widgets/home_page.dart';
import '../../presention/main/screens/widgets/pages.dart';
import '../../presention/main/screens/widgets/profilePage.dart';
import 'state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.api) : super(AppInitial());

  final ApiConsumer api;
  SignInModel? user;
  XFile? profilePic;
  String? name;
  String? image;
  int? sumBreakFastCals;
  int? sumDinnerCals;
  int? sumLunchCals;
  int? sumSnacksCals;
  int? sumFat;
  int? sumProtein;
  int? sumCarb;
  int index = 0;
  String gender = '';
  int hight = 0;
  String weight = "";
  int old = 0;
  List<int> totalBreakFastCals = [];
  List<Meal> totalItem = [];
  List<int> totalLunchCals = [];
  List<int> totalDinnerCals = [];
  List<int> totalSnacksCals = [];
  List<int> totalProtein = [];
  List<int> totalFat = [];
  List<int> totalCarb = [];

  void deleteitem() {
    sumBreakFastCals = 0;
    sumDinnerCals = 0;
    sumLunchCals = 0;
    sumSnacksCals = 0;
    sumFat = 0;
    sumProtein = 0;
    sumCarb = 0;
    totalBreakFastCals = [];
    totalLunchCals = [];
    totalItem = [];
    totalDinnerCals = [];
    totalSnacksCals = [];
    totalProtein = [];
    totalFat = [];
    totalCarb = [];
    emit(Showitem());
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  uploadImage({required XFile profilePic}) async {
    try {
      emit(UploadProfilePicLoading());
      final response = await api.post(
        EndPoint.getUserIdUploadimage(
            CacheHelper().getData(key: ApiKey.userId)),
        isFromData: true,
        data: {"image": await uploadImageToAPI(profilePic)},
      );
      print(response);
      emit(UploadProfilePicSucess());
    } on ServerException catch (e) {
      emit(UploadProfilePicFailure(errMessage: e.errModel.errorMessage));
    }
  }

  AppCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;

  void changeBottomNav(int index) {
    currentPage = index;
    emit(AppChangeBottomNav());
  }

  void ontapitem() {
    emit(Showitem());
  }

  List<Widget> getPages(BuildContext context) {
    var newVariable = CacheHelper().getData(key: "index");
    return [
      HomePage(
        diet: diet[newVariable != null
            ? newVariable + 1
            : context.read<AppCubit>().index],
      ),
      const Exercisespage(),
      const DietsPage(),
      const ProfilePage(),
    ];
  }

  dynamic bottomNav() => CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        items: const [
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Iconsax.activity4),
            label: 'Exercises',
          ),
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.chart_bar_circle),
            label: 'Diet',
          ),
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
        index: currentPage,
        onTap: (index) {
          currentPage = index;
          emit(AppChangeBottomNav());
        },
      );

  signUp(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
        },
      );
      emit(SignUpSuccess());
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper()
          .saveData(key: ApiKey.userId, value: decodedToken[ApiKey.userId]);
      print(decodedToken[ApiKey.userId]);
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  signIn({required String email, required String password}) async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      emit(SignInSuccess());
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper()
          .saveData(key: ApiKey.userId, value: decodedToken[ApiKey.userId]);
      print(decodedToken[ApiKey.userId]);
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  getFood() async {
    try {
      final response = await api.get(
        EndPoint.categories,
      );
      final getDataFood = FoodModel.fromJson(response);
      print(getDataFood);

      // print("${getData.name} ${getData.email} ${getData.profilePic}");
      emit(GetFoodSuccess(foodList: [getDataFood]));
    } on ServerException catch (e) {
      emit(GetFoodFailure(errMessage: e.errModel.errorMessage));
    }
  }

  getUser() async {
    try {
      emit(GetUserLoading());
      final response = await api.get(
        EndPoint.getUserData(
          CacheHelper().getData(key: ApiKey.userId),
        ),
      );
      final getData = UserModel.fromJson(response);

      print("${getData.name} ${getData.email} ${getData.profilePic}");
      emit(GetUserSucess(user: getData));
      name = getData.name;
      image = getData.profilePic;
      // CacheHelper().saveData(key: ApiKey.name, value: getData.name);
      // CacheHelper().saveData(key: ApiKey.email, value: getData.email);
      // CacheHelper().saveData(key: ApiKey.profilePic, value: getData.profilePic);
    } on ServerException catch (e) {
      emit(GetUserFailure(errMessage: e.errModel.errorMessage));
    }
  }

  int counter = 30;
  countplus() {
    counter++;
    emit(AppChangeCounterplus());
  }

  countminus() {
    if (counter > 0) {
      counter--;
    }
    emit(AppChangeCounterminus());
  }
}
