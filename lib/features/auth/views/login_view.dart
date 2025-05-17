import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/helper/my_navigator.dart';

import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/translation/translation_keys.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/utils/app_text_styles.dart';
import 'package:nti_grad_project/core/widgets/custom_circular_progress.dart';
import 'package:nti_grad_project/core/widgets/custom_password_form_field.dart';
import 'package:nti_grad_project/core/widgets/email_form_field.dart';
import 'package:nti_grad_project/core/widgets/my_button.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_states.dart';
import 'package:nti_grad_project/features/home_screen/views/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              // UserCubit.get(context).getUserData(user: state.userModel);
              // now in UserGetSuccess state an object state will carry user data to use in any screen

              MyNavigator.goTo(screen: () => HomeView(), isReplace: true);
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMsg),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 32,
                  end: 26,
                  top: 40,
                ),
                child: Form(
                  key: LoginCubit.get(context).formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSvg(
                        path: AppAssets.leftIcon,
                        height: ResponsiveHelper.h(context, height: 19),
                        width: ResponsiveHelper.w(context, width: 9.5),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: ResponsiveHelper.h(context, height: 42)),
                      Text(
                        TranslationKeys.welcomeBack.tr,
                        style: AppTextStyles.f36w700(context),
                      ),
                      SizedBox(height: ResponsiveHelper.h(context, height: 45)),
                      CustomFormField.getTextFormField(
                        context: context,
                        prefixIconPath: AppAssets.emailIcon,
                        hintText: TranslationKeys.emailHintText.tr,
                        emailController:
                            LoginCubit.get(context).emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: ResponsiveHelper.h(context, height: 28)),
                      CustomPasswordFormField.getTextPasswordField(
                        context: context,
                        hintText: TranslationKeys.passwordHintText.tr,
                        passwordController:
                            LoginCubit.get(context).passwordController,
                        isPasswordVisible:
                            LoginCubit.get(context).isPasswordVisible,
                        onTap: LoginCubit.get(context).togglePasswordVisibility,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            //  errorMsg = true;
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: ResponsiveHelper.h(context, height: 56)),
                      state is LoginLoading
                          ? Center(child: CustomCircularProgressIndicator())
                          : MyButton(
                            title: TranslationKeys.login.tr,
                            onPressed: LoginCubit.get(context).onLoginPressed,
                          ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
