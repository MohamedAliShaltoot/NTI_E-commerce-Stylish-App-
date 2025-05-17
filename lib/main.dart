import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nti_grad_project/core/cache/cache_data.dart';
import 'package:nti_grad_project/core/cache/cache_helper.dart';
import 'package:nti_grad_project/core/translation/translation_helper.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/core/utils/app_strings.dart';
import 'package:nti_grad_project/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:nti_grad_project/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:nti_grad_project/features/on_boarding/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp(const StylishApp());
}

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
         BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
      ],
      child: GetMaterialApp(
        locale: Locale(CacheData.lang!),
        translations: TranslationHelper(),
        debugShowCheckedModeBanner: false,
      
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: AppStrings.fontFamily,
        ),
        title: AppStrings.appTitle,
      
        home: SplashView(),
      ),
    );
  }
}
