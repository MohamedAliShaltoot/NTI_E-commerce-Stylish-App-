import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_grad_project/features/auth/data/auth_repo/auth_repo.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;

AuthRepo authRepo = AuthRepo();

void onLoginPressed() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    var result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    // fold is used to handle the result of the login attempt
    // if the result is a failure (left), emit LoginFailure state
    // if the result is a success (right), emit LoginSuccessState with the user model
    result.fold(
      (error) {
        emit(LoginFailure(error));
      },
      (userModel) {
        emit(LoginSuccessState(userModel));
      },
    );
  }
































void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    if (isPasswordVisible) {
      emit(ShowPassword());
    } else {
      emit(HidePassword());
    }
  }

}