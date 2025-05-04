import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_11_task/core/helper/responsive.dart';
import 'package:nti_11_task/features/home/views/home_page.dart';
import 'package:nti_11_task/features/options/views/options._page.dart';

import 'features/auth/views/login_page.dart';

import 'core/utils/app_text_styles.dart';

import 'core/utils/app_colors.dart';
import 'features/home/manager/user_cubit/user_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            title: 'To-Do',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: AppTextStyles.fontFamily,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
