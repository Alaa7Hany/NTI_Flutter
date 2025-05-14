import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_14_task/features/home/manager/user_cubit/user_cubit.dart';
import '../../home/views/home_page.dart';
import '../../../core/helper/get_helper.dart';
import '../../auth/views/login_page.dart';
import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import 'on_boarding_page.dart';
import 'dart:async';
import '../../../core/utils/app_assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      CacheData.loggedIn = CacheHelper.getData(key: CacheKeys.loggedIn);
      CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
      // CacheHelper.removeData(key: CacheKeys.firstTime);
      // CacheHelper.removeData(key: CacheKeys.loggedIn);
      if (CacheData.firstTime == null) {
        GetHelper.pushReplace(() => const OnBoardingPage());
      } else if (CacheData.accessToken != null) {
        UserCubit.get(context).getUserFromCache();
        // UserCubit.get(context).refreshToken();

        GetHelper.pushReplace(() => const HomePage());
      }
      // else if (CacheData.loggedIn == null) {
      //   GetHelper.pushReplace(() => const LoginPage());
      // }
      else {
        GetHelper.pushReplace(() => const HomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppAssets.splash, fit: BoxFit.fill)),
    );
  }
}
