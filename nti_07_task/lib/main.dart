import 'package:flutter/material.dart';
import 'package:nti_06_task/features/add_task/edit_task_page.dart';
import 'package:nti_06_task/features/add_task/views/add_task_page.dart';
import 'package:nti_06_task/features/auth/views/signup_page.dart';
import 'package:nti_06_task/features/home/views/home_page.dart';
import 'package:nti_06_task/features/home/views/today_tasks_page.dart';
import 'features/auth/views/login_page.dart';

import 'core/utils/app_text_styles.dart';

import 'core/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppTextStyles.fontFamily,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
      home: LoginPage(),
    );
  }
}
