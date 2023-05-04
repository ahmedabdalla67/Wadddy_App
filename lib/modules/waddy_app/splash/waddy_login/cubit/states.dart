import 'package:first_app/models/Waddy_app/Waddy_app_model.dart';

abstract class WaddyLoginStates {}

class WaddyLoginInitialState extends WaddyLoginStates{}

class WaddyLoadingState extends WaddyLoginStates{}

// class WaddyLoginSuccessState extends WaddyLoginStates{
//   final WaddyLoginModel loginModel;
//
//   WaddyLoginSuccessState(this.loginModel);
// }

class WaddyLoginErrorState extends WaddyLoginStates{
  final String error;

  WaddyLoginErrorState(this.error);
}

class LoginLoadingState extends WaddyLoginStates{}
class LoginSuccessState extends WaddyLoginStates{}
class FailedToLoginState extends WaddyLoginStates{
  final String message;

  FailedToLoginState({required this.message});
}


class WaddyChangePasswordVisibilityState extends WaddyLoginStates{}

class WaddyForgetPasswordState extends WaddyLoginStates{}
