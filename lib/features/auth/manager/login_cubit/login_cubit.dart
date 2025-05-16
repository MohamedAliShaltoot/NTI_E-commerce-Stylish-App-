import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;



void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    if (isPasswordVisible) {
      emit(ShowPassword());
    } else {
      emit(HidePassword());
    }
  }

}