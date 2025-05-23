import 'package:nti_grad_project/features/auth/data/models/login_response_model.dart';

abstract class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessState extends LoginState {
  UserModel userModel;
  LoginSuccessState(this.userModel);
}

class LoginFailure extends LoginState {
  final String errorMsg;

  LoginFailure(this.errorMsg);
}

class ShowPassword extends LoginState {}

class HidePassword extends LoginState {}
