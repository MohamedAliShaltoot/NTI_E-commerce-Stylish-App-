import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_grad_project/features/auth/data/auth_repo/auth_repo.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInit());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  int selectedGender = 0;
  bool isChecked = false;
  String? error;
  XFile? image;
  AuthRepo authRepo = AuthRepo();
  static RegisterCubit get(context) => BlocProvider.of(context);

  void onRegisterPressed() {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      var result = authRepo.register(
        fullName: nameController.text,
        password: passwordController.text,
         email: emailController.text,
          phone: phoneController.text,
       
      );
      result.fold(
        (String error) // left
        {
          emit(RegisterFailure(error));
        },
        (r) // right
        {
          emit(RegisterSuccessState());
        },
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    if (isPasswordVisible) {
      emit(ShowPassword());
    } else {
      emit(HidePassword());
    }
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    if (isConfirmPasswordVisible) {
      emit(ShowPassword());
    } else {
      emit(HidePassword());
    }
  }
}
