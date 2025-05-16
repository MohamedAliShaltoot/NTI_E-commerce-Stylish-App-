import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/helper/nav_helper.dart';
import 'package:nti_grad_project/core/widgets/svg_wrapper.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/utils/app_assets.dart';
import 'onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    //navigate(context);
  }

  // void navigate(context)async
  //     {
  //  Future.delayed((Duration(milliseconds: 500)),
  //           ()
  //        {
  //         CacheData.checkFirstTime = CacheHelper.getData(key: CacheKeys.checkFirstTime,
  //       );
  //       CacheData.loggedIn = CacheHelper.getData(key: CacheKeys.loggedIn);
  //       // CacheHelper.removeData(key: CacheKeys.firstTime);
  //       // CacheHelper.removeData(key: CacheKeys.loggedIn);
  //       // if (CacheData.firstTime == null) {
  //       //   NavHelper.pushReplace(() => const OnBoardingPage());
  //       // } else if (CacheData.loggedIn == null) {
  //       //   NavHelper.pushReplace(() => const LoginPage());
  //       // } else {
  //       //   NavHelper.pushReplace(() => const HomePage());
  //       // }

  //       NavHelper.pushReplace(() => const OnBoardingView());
  //        });
  //     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          NavHelper.pushReplace(() => const OnBoardingView());
        },
        child: Center(
          child: SvgWrapper(assetName: AppAssets.splash, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
