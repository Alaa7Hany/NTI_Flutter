import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_06_task/utils/app_assets.dart';
import 'package:nti_06_task/utils/app_colors.dart';

class SimpleAppBar {
  static AppBar build(String title, void Function()? onPressed) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(AppAssets.arrowLeft),
        onPressed: onPressed,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w300,
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: AppColors.scaffoldBackground,
    );
  }
}
