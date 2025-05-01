import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

abstract class HomeAppBar {
  static AppBar build({
    String name = 'Alaa Hany',
    void Function()? onProfilePressed,
    bool action = true,
  }) {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: InkWell(
          onTap: onProfilePressed,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.scaffoldBackground,
                child: ClipOval(
                  child: Image.asset(
                    AppAssets.profileImage,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Colors.transparent,
    );
  }
}
