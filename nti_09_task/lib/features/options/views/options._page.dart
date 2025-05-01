import 'package:flutter/material.dart';
import 'Update_password_page.dart';
import 'language_page.dart';
import 'update_username_page.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/home_appbar.dart';
import 'widgets/option_container.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar.build(
          action: false,
          onProfilePressed: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              OptionContainer(
                title: 'Update Profile',
                icon: AppAssets.profile,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const UpdateUsernamePage();
                      },
                    ),
                  );
                },
              ),
              OptionContainer(
                title: 'Change Password',
                icon: AppAssets.lock,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const UpdatePasswordPage();
                      },
                    ),
                  );
                },
              ),
              OptionContainer(
                title: 'Settings',
                icon: AppAssets.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LanguagePage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
