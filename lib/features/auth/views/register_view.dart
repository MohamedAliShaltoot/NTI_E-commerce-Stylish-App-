import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/helper/my_navigator.dart';

import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/translation/translation_keys.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/core/utils/app_text_styles.dart';
import 'package:nti_grad_project/core/widgets/custom_circular_progress.dart';
import 'package:nti_grad_project/core/widgets/custom_password_form_field.dart';
import 'package:nti_grad_project/core/widgets/email_form_field.dart';
import 'package:nti_grad_project/core/widgets/my_button.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_states.dart';
import 'package:nti_grad_project/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:nti_grad_project/features/auth/manager/register_cubit/register_state.dart';
import 'package:nti_grad_project/features/auth/views/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              // UserCubit.get(context).getUserData(user: state.userModel);
              // now in UserGetSuccess state an object state will carry user data to use in any screen

              MyNavigator.goTo(screen: () => LoginView(), isReplace: true);
            }
            if (state is RegisterFailure) {
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
                child: SingleChildScrollView(
                  child: Form(
                    key: RegisterCubit.get(context).formKey,
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
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 42),
                        ),
                        Text(
                          TranslationKeys.createAnAccount.tr,
                          style: AppTextStyles.f36w700(context),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 45),
                        ),
                        CustomFormField.getTextFormField(
                          context: context,
                          prefixIconPath: AppAssets.userIcon,
                          hintText: TranslationKeys.fullNameHintText.tr,
                          emailController:
                              RegisterCubit.get(context).nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full name is required';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),
                        CustomFormField.getTextFormField(
                          context: context,
                          prefixIconPath: AppAssets.phoneIcon,
                          hintText: TranslationKeys.phoneHintText.tr,
                          emailController:
                              RegisterCubit.get(context).phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'phone is required';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),

                        CustomFormField.getTextFormField(
                          context: context,
                          prefixIconPath: AppAssets.emailIcon,
                          hintText: TranslationKeys.emailHintText.tr,
                          emailController:
                              RegisterCubit.get(context).emailController,
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

                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),
                        CustomPasswordFormField.getTextPasswordField(
                          context: context,
                          hintText: TranslationKeys.passwordHintText.tr,
                          passwordController:
                              RegisterCubit.get(context).passwordController,
                          isPasswordVisible:
                              RegisterCubit.get(context).isPasswordVisible,
                          onTap:
                              RegisterCubit.get(
                                context,
                              ).togglePasswordVisibility,
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
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),

                        CustomPasswordFormField.getTextPasswordField(
                          context: context,
                          hintText: TranslationKeys.confirmPasswordHintText.tr,
                          passwordController:
                              RegisterCubit.get(
                                context,
                              ).confirmPasswordController,
                          isPasswordVisible:
                              RegisterCubit.get(
                                context,
                              ).isConfirmPasswordVisible,
                          onTap:
                              RegisterCubit.get(
                                context,
                              ).toggleConfirmPasswordVisibility,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                RegisterCubit.get(
                                      context,
                                    ).passwordController.text !=
                                    value) {
                              return "Confirm Password cannot be empty or not match";
                            } else if (value.length < 6) {
                              return "Confirm Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 21),
                        ),
                        RichText(
                          text: TextSpan(
                            style: AppTextStyles.f14w400WithGreyColor(
                              context,
                            ).copyWith(color: Color(0xff676767)),
                            children: [
                              TextSpan(
                                text: 'By clicking the ',
                              ), // normal black text
                              TextSpan(
                                text: 'Register', // word to be colored
                                style: TextStyle(
                                  color: AppColors.primary,
                                ), // colored word
                              ),
                              TextSpan(
                                text: ' button, you agree\n ',
                                style: AppTextStyles.f14w400WithGreyColor(
                                  context,
                                ).copyWith(color: Color(0xff676767)),
                              ),
                              TextSpan(
                                text: 'to the public offer',
                                style: AppTextStyles.f14w400WithGreyColor(
                                  context,
                                ).copyWith(color: Color(0xff676767)),
                              ), // normal black text again
                            ],
                          ),
                        ),

                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 28),
                        ),
                        state is RegisterLoading
                            ? Center(child: CustomCircularProgressIndicator())
                            : Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: MyButton(
                                title: TranslationKeys.createAccount.tr,
                                onPressed:
                                    RegisterCubit.get(
                                      context,
                                    ).onRegisterPressed,
                              ),
                            ),
                      ],
                    ),
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


// password: qweasd
// email:moali@gmail.com
// phone: 01000000001