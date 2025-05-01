import 'package:flutter/cupertino.dart';
import 'package:nti_06_task/core/utils/app_assets.dart';

class AddTaskImage extends StatelessWidget {
  const AddTaskImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(AppAssets.logo, fit: BoxFit.cover),
      ),
    );
  }
}
