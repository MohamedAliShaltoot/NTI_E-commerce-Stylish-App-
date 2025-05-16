import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nti_grad_project/core/cache/cache_data.dart';
import 'package:nti_grad_project/core/cache/cache_helper.dart';
import 'package:nti_grad_project/core/translation/translation_helper.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/core/utils/app_strings.dart';
import 'package:nti_grad_project/features/on_boarding/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(CacheData.lang!),
      translations: TranslationHelper(),
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: AppStrings.fontFamily,
      ),
      title: AppStrings.appTitle,
      
      home: SplashView(),
    );
  }
}

