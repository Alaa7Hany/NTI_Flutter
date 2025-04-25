import 'package:flutter/material.dart';

import '../../../core/widgets/my_custom_button.dart';
import '../../../core/widgets/my_text_form_field.dart';
import '../../home/views/home_page.dart';
import 'signup_page.dart';
import 'widgets/main_image.dart';
import 'widgets/my_footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainImage(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    MyTextFormField(
                      keyboardType: TextInputType.name,
                      hint: 'Username',
                      controller: usernameController,
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hint: 'Password',
                      onChangeVisibality: onChangeVisibality,
                      visibality: visibality,
                      controller: passwordController,
                    ),

                    SizedBox(height: 15),
                    MyCustomeButton(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all fields'),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    MyFooter(
                      title: 'Don\'t Have An Account?',
                      action: 'Register',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                    ),
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
