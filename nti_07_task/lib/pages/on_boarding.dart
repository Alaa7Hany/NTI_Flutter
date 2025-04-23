import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_06_task/pages/signup_page.dart';
import 'package:nti_06_task/utils/app_assets.dart';
import 'package:nti_06_task/utils/app_colors.dart';
import 'package:nti_06_task/widgets/my_custom_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.onboarding),
              SizedBox(height: 30),
              const Text(
                'Welcome To \nDo It !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                'Ready to conquer your tasks? Let\'s Do It together.',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MyCustomeButton(
                  text: 'Let\'s Start',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
