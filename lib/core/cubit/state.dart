import 'package:healthystate/core/models/user_model.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNav extends AppState {}

class Showitem extends AppState {}

class SignUpSuccess extends AppState {}

class SignInSuccess extends AppState {}

class SignUpFailure extends AppState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

class GetFoodSuccess extends AppState {
  final List<dynamic> foodList;
  GetFoodSuccess({required this.foodList});
}

class GetFoodFailure extends AppState {
  final String errMessage;
  GetFoodFailure({required this.errMessage});
}

class SignInFailure extends AppState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}

class SignUpLoading extends AppState {}

class SignInLoading extends AppState {}

class UploadProfilePic extends AppState {}

class UploadProfilePicLoading extends AppState {}

class UploadProfilePicSucess extends AppState {}

class UploadProfilePicFailure extends AppState {
  final String errMessage;
  UploadProfilePicFailure({required this.errMessage});
}

class GetUserSucess extends AppState {
  final UserModel user;
  GetUserSucess({required this.user});
}

class GetUserLoading extends AppState {}

class GetUserFailure extends AppState {
  final String errMessage;
  GetUserFailure({required this.errMessage});
}

class AppChangeCounterplus extends AppState {}

class AppChangeCounterminus extends AppState {}
