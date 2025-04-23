import 'package:flutter/material.dart';
import 'package:nti_06_task/utils/app_colors.dart';
import 'package:nti_06_task/widgets/main_image.dart';
import 'package:nti_06_task/widgets/my_custom_button.dart';
import 'package:nti_06_task/widgets/my_text_form_field.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  int? selectedGender = 0;
  bool rememberMe = false;
  bool showPass = true;
  final _formKey = GlobalKey<FormState>();

  bool visibality() {
    return showPass;
  }

  void onChangeVisibality() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hint: 'Old pass',
                      controller: oldPassController,
                      onChangeVisibality: onChangeVisibality,
                      visibality: visibality,
                    ),
                    SizedBox(height: 30),
                    MyTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hint: 'New pass',
                      controller: newPassController,
                      onChangeVisibality: onChangeVisibality,
                      visibality: visibality,
                    ),
                    SizedBox(height: 30),
                    MyTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hint: 'Confirm pass',
                      controller: confirmPassController,
                      onChangeVisibality: onChangeVisibality,
                      visibality: visibality,
                      isConfirmPass: true,
                      passController: newPassController,
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
