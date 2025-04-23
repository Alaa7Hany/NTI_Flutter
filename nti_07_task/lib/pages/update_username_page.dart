import 'package:flutter/material.dart';
import 'package:nti_06_task/utils/app_colors.dart';
import 'package:nti_06_task/widgets/main_image.dart';
import 'package:nti_06_task/widgets/my_custom_button.dart';
import 'package:nti_06_task/widgets/my_text_form_field.dart';

class UpdateUsernamePage extends StatefulWidget {
  const UpdateUsernamePage({super.key});

  @override
  State<UpdateUsernamePage> createState() => _UpdateUsernamePageState();
}

class _UpdateUsernamePageState extends State<UpdateUsernamePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainImage(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    MyTextFormField(
                      keyboardType: TextInputType.name,
                      hint: 'Username',
                      controller: usernameController,
                    ),

                    SizedBox(height: 30),
                    MyCustomeButton(
                      text: 'Update',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
